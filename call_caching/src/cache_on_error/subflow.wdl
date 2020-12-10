version 1.0

task hello_world {
    input {
      String name
    }
    command {
        exit 1
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
        input: name=testing
    }
    output {
        File out = hello_world.out
    }
}