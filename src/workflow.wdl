import "subworkflow.wdl" as sub

workflow Main {
  String action

  call sub.Wf {  
  }

  output {
    String message = "${action} ${select_first(read_lines(Wf.outputFile))}"
  }
}
