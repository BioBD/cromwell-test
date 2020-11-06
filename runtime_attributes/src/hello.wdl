version 1.0

task hello_world {
    input {
      String name = "World"
    }
    command {
        echo 'Hello, ${name}'
    }
    output {
        File out = stdout()
    }
    runtime {
        myName: name
    }
}

workflow hello {
    call hello_world
}