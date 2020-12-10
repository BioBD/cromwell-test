version 1.0

import "subworkflow.wdl" as sub


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

workflow Main {
    input {
        String name 
    }
    call hello_world
    call sub.Wf {
        testing = name
    }
}