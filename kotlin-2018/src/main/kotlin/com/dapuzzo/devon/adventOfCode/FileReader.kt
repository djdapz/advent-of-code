package com.dapuzzo.devon.adventOfCode

class FileReader(private val fileName: String) {

    fun read(): String = FileReader::class.java.getResource("/$fileName").readText()

    fun readAsList(): List<String> = read().split("\n")

}