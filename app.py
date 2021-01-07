#!/usr/bin/env python3

from aws_cdk import (core, aws_ec2 as ec2, aws_ecs as ecs,
                     aws_ecs_patterns as ecs_patterns)

class HelloWorldCdkStack(core.Stack):

    def __init__(self, scope: core.Construct, construct_id: str, **kwargs) -> None:
        super().__init__(scope, construct_id, **kwargs)

        vpc = ec2.Vpc(self, "MyVpc", max_azs=3)
        cluster = ecs.Cluster(self, "MyCluster", vpc=vpc)
        ecs_patterns.ApplicationLoadBalancedFargateService(self, "MyFargateService",
                                                           cluster=cluster,
                                                           cpu=512,
                                                           desired_count=3,
                                                           task_image_options=ecs_patterns.ApplicationLoadBalancedTaskImageOptions(
                                                               image=ecs.ContainerImage.from_asset("./hello_world_app"),
                                                               container_port=8080
                                                           ),
                                                           memory_limit_mib=1024,
                                                           public_load_balancer=True)

app = core.App()
HelloWorldCdkStack(app, "hello-world-cdk")

app.synth()
