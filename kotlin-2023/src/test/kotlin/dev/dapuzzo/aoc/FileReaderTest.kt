package dev.dapuzzo.aoc

import org.assertj.core.api.Assertions.assertThat
import org.junit.jupiter.api.Assertions.*
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