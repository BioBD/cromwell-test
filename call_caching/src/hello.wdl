version 1.0

task hello_world {
    input {
      String name = "World"
    }
    command {
        sleep 10;echo 'Hello, ${name}'
    }
    output {
        File out = stdout()
    }
}

workflow hello {
    call hello_world
}