package cli

import (
	"fmt"
	"time"
	"sort"
	"os"

	"github.com/urfave/cli"
)

// project version
var VERSION = "0.1-SNAPSHOT"

func init() {
	cli.VersionFlag = cli.BoolFlag{Name: "version, V"}
	cli.VersionPrinter = func(c *cli.Context) {
		fmt.Fprintf(c.App.Writer, "openshift-template-validator version %s\n", VERSION)
	}
}

func Execute() {
	app := cli.NewApp()
	app.Name = "openshift-template-validator"
	app.Usage = "Validate your OpenShift Application Templates, easier than never."
	app.Version = VERSION
	app.Compiled = time.Now()
	app.Email = "bsig-cloud@redhat.com"

	// Commands
	app.Commands = []cli.Command{
		validateCommand,
	}
	sort.Sort(cli.FlagsByName(app.Flags))
	sort.Sort(cli.CommandsByName(app.Commands))
	app.Run(os.Args)
}
