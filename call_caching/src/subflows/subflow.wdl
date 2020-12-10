version 1.0

task hello_world {
    input {
      String name
    }
    command {
        sleep 10;echo 'Hello, ${name}'
    }
    output {
        File out = stdout()
    }
}

workflow Wf {
    input {
        String testing 
    }
    call hello_world {
        name = testing
    }
}