package golang

import (
	"context"

	"go.temporal.io/sdk/activity"
)

// If you wish to connect any dependencies (eg, database), add in here
type activities struct {
	// Database  *gorm.DB
}

// This is a simple activity that says "hello" to the name given
func (a *activities) SayName(ctx context.Context, name string) (string, error) {
	logger := activity.GetLogger(ctx)
	logger.Info("Activity", "name", name)

	if name == "" {
		name = "anonymous human"
	}

	return "Hello " + name + "!", nil
}

// If you need to inject dependencies, pass them in here
// The error response can be useful
func NewActivities( /*dbConnection *gorm.DB*/ ) (*activities, error) {
	return &activities{
		// Database: dbConnection,
	}, nil
}
