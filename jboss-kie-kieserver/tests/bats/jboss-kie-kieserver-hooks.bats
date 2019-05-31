#!/usr/bin/env bats

export JBOSS_HOME=$BATS_TMPDIR/jboss_home
mkdir -p $JBOSS_HOME/bin/launch

cp $BATS_TEST_DIRNAME/../../../tests/bats/common/launch-common.sh $JBOSS_HOME/bin/launch
cp $BATS_TEST_DIRNAME/../../../tests/bats/common/logging.bash $JBOSS_HOME/bin/launch/logging.sh
cp $BATS_TEST_DIRNAME/../../../jboss-kie-common/added/launch/jboss-kie-common.sh $JBOSS_HOME/bin/launch/jboss-kie-common.sh

#imports
source $BATS_TEST_DIRNAME/../../added/launch/jboss-kie-kieserver-hooks.sh


@test "test container lifecycle hook - scaledown scenario" {
    export WORKBENCH_SERVICE_NAME="rhpam-central-console"
    export KIE_SERVER_ID="rhpam-kieserevr-1"

    exec $($BATS_TEST_DIRNAME/../../added/jboss-kie-kieserver-hoots.sh)
}