task hello {
    command {
      echo "Hello"
    }
    runtime {
      docker: "broadinstitute/gatk@sha256:8051adab0ff725e7e9c2af5997680346f3c3799b2df3785dd51d4abdd3da747b"
    }
}

workflow Main {
    String message

    call hello
    output {
      String output = message
    }
}
