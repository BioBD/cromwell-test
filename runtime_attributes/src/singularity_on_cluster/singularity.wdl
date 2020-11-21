version 1.0

task hello_world {
    input {
      String name = "World"
    }
    command {
        echo 'Hello, ${name}' >> /tmp/teste
    }
    output {
        File out = "/tmp/teste"
    }
    runtime {
        docker: "broadinstitute/gatk@sha256:8051adab0ff725e7e9c2af5997680346f3c3799b2df3785dd51d4abdd3da747b"
        extraMount: ",/tmp:/tmp"
    }
}

workflow hello {
    call hello_world
}