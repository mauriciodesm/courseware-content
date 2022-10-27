package br.com.alura.forum.service

import br.com.alura.forum.model.Curso
import br.com.alura.forum.model.Usuario
import br.com.alura.forum.repository.UsuarioRepository
import org.springframework.stereotype.Repository
import org.springframework.stereotype.Service
import java.util.Arrays

@Service
class UsuarioService (private val repository: UsuarioRepository){
    fun buscarPorId(id: Long): Usuario {
        return repository.getReferenceById(id)
    }
}