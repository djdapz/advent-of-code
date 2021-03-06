package com.dapuzzo.devon.adventOfCode._2018

import com.dapuzzo.devon.adventOfCode.FileReader
import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Test

class FileReaderTest {
    @Test
    fun shouldReturnTextOfFile() {
        val fileContents = FileReader("test.txt").read()
        assertThat(fileContents).isEqualTo("hello\nit's me")
    }

    @Test
    fun shouldReturnTextOfFileAsList() {
        val fileContents = FileReader("test.txt").readAsList()
        assertThat(fileContents).isEqualTo(listOf("hello", "it's me"))
    }
}