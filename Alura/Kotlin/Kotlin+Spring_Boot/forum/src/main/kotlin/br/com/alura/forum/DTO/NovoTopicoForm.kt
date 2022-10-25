package br.com.alura.forum.DTO

import javax.validation.constraints.NotEmpty
import javax.validation.constraints.NotNull
import javax.validation.constraints.Size

data class NovoTopicoForm (
        @field:Size(min = 5, max = 100, message = "Título deve ter entre 5 e 100 caracteres.")
        @field:NotEmpty(message = "Campo título não pode estar vazio.")
        val titulo: String,
        @field:NotEmpty(message = "Campo mensagem não pode estar em branco.")
        val mensagem: String,
        @field:NotNull(message = "Campo 'id curso' não pode estar em branco.")
        val idCurso: Long,
        @field:NotNull(message = "Campo 'id autor' não pode estar em branco.")
        val idAutor: Long
)