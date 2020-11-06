task hello {
    command {
      echo "Hello"
    }
}

workflow Main {
    String message

    call hello
    output {
      String output = message
    }
}
