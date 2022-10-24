package br.com.alura.forum.service

import br.com.alura.forum.model.Curso
import br.com.alura.forum.model.Topico
import br.com.alura.forum.model.Usuario
import org.springframework.stereotype.Service
import java.util.*

@Service
class TopicoService(private var topicos: List<Topico>) {

    init {
        val topico = Topico(
            id = 1,
            titulo = "Duvida Kotlin",
            mensagem = "variaveis no kotlin",
            curso = Curso(
                id = 1,
                nome = "Kotlin",
                categoria = "Programação",
            ),
            autor = Usuario(
                id = 1,
                usuario = "Ana da Silva",
                email = "anadasilva@email.com"
            )
        )

        val topico2 = Topico(
            id = 2,
            titulo = "Duvida Kotlin 2",
            mensagem = "variaveis no kotlin 2",
            curso = Curso(
                id = 2,
                nome = "Kotlin",
                categoria = "Programação",
            ),
            autor = Usuario(
                id = 2,
                usuario = "Ana da Silva",
                email = "anadasilva@email.com"
            )
        )
        topicos =  Arrays.asList(topico, topico2)
    }
    fun listar(): List<Topico>{
        return topicos
    }

    fun buscarPorId(id: Long): Topico {
        return topicos.stream().filter({
            t -> t.id == id
        }).findFirst().get()
    }
}
