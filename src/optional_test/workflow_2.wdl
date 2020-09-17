task NeedsMessage {
  String message

  command {

    echo ${message}
  }

  output {
    File messageFile = stdout()
  }
}

task NeedMessageButNull {
  String? message

  command {
    echo ${message}
  }

  output {
    String messageFile = stdout()
  }
}

task NeedMessageByJson {
  String? message

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

  String? myField
  Boolean isDefined = defined(myField)

  if (isDefined){
    call NeedsMessage {
      input: message = myField
    }
  }
  if (!isDefined){
    call DoesntNeedMessage
    call NeedMessageButNull
    call NeedMessageByJson
  }

  output {
    File? outputFile = NeedsMessage.messageFile
  }
}