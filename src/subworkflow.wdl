task SaveFile {
  String message

  command {
    echo ${message}
  }

  output {
    File messageFile = stdout()
  }
}

workflow Wf {
  call SaveFile

  output {
    File outputFile = SaveFile.messageFile
  }
}