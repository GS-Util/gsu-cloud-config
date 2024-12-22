package com.gsu.gsucloudconfig

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.cloud.config.server.EnableConfigServer

@SpringBootApplication
@EnableConfigServer
class GsuCloudConfigApplication

fun main(args: Array<String>) {
    runApplication<GsuCloudConfigApplication>(*args)
}
