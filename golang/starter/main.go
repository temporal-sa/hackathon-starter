package main

import (
	"context"
	"log"

	"github.com/temporal-sa/hackathon-starter/golang"
	"go.temporal.io/sdk/client"
	"go.temporal.io/sdk/contrib/envconfig"
)

func main() {
	// The client and worker are heavyweight objects that should be created once per process.
	c, err := client.Dial(envconfig.MustLoadDefaultClientOptions())
	if err != nil {
		log.Fatalln("Unable to create Temporal client", err)
	}
	defer c.Close()

	workflowOptions := client.StartWorkflowOptions{
		TaskQueue: golang.TASK_QUEUE_NAME,
	}

	ctx := context.Background()

	// Execute the hello-world workflow with the input "Hacker"
	we, err := c.ExecuteWorkflow(ctx, workflowOptions, golang.HelloWorldWorkflow, "Hacker")
	if err != nil {
		log.Fatalln("Unable to execute workflow", err)
	}

	log.Println("Started workflow", "WorkflowID", we.GetID(), "RunID", we.GetRunID())

	// Synchronously wait for the workflow completion.
	var result string
	err = we.Get(ctx, &result)
	if err != nil {
		log.Fatalln("Unable get workflow result", err)
	}
	log.Println("Workflow result:", result)
}
