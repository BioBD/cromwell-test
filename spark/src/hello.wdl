version 1.0

task hello_world {
    command {
        gatk PrintReadsSpark --spark-master local[*] --help
    }
    output {
        Array[String] out = read_lines(stderr())
    }
}

workflow hello {
    call hello_world
}