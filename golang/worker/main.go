package main

import (
	"log"

	"github.com/temporal-sa/hackathon-starter/golang"
	"go.temporal.io/sdk/client"
	"go.temporal.io/sdk/contrib/envconfig"
	"go.temporal.io/sdk/worker"
)

func main() {
	// The client and worker are heavyweight objects that should be created once per process.
	c, err := client.Dial(envconfig.MustLoadDefaultClientOptions())
	if err != nil {
		log.Fatalln("Unable to create Temporal client", err)
	}
	defer c.Close()

	// Create the workflow with the task queue "hackathon"
	w := worker.New(c, golang.TASK_QUEUE_NAME, worker.Options{})

	// Register the workflows
	w.RegisterWorkflow(golang.HelloWorldWorkflow)

	// Register the activities - you may need to inject dependencies in here
	activities, err := golang.NewActivities()
	if err != nil {
		log.Fatalln("Error creating activities", err)
	}
	w.RegisterActivity(activities)

	if err := w.Run(worker.InterruptCh()); err != nil {
		log.Fatalln("Unable to start worker", err)
	}
}
