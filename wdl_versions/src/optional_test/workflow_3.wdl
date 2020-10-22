version 1.0

task NeedsMessage {
  input {
      String message
  }
  command {

    echo ${message}
  }

  output {
    File messageFile = stdout()
  }
}

task NeedMessageButNull {
  input {
      String? message
  }

  command {
    echo ${message}
  }

  output {
    String messageFile = stdout()
  }
}

task DoesntNeedMessage {

  command {
    echo "Hello"
  }

  output {
    String messageFile = stdout()
  }
}


workflow Wf {

  input {
      String? myField
  }
  
  Boolean isDefined = defined(myField)
  
  if (isDefined){
    call NeedsMessage {
      input: message = myField
    }
  }
  if (!isDefined){
    call DoesntNeedMessage
    call NeedMessageButNull
  }

  output {
    File? outputFile = NeedsMessage.messageFile
  }
}