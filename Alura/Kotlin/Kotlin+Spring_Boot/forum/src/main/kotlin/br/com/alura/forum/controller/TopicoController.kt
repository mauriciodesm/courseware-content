package br.com.alura.forum.controller

import br.com.alura.forum.DTO.NovoTopicoForm
import br.com.alura.forum.DTO.TopicoView
import br.com.alura.forum.service.TopicoService
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import javax.validation.Valid

@RestController
@RequestMapping("/topicos")
class TopicoController(private val service: TopicoService) {

    @GetMapping
    fun listar(): List<TopicoView> {
        return service.listar()
    }

    @GetMapping("/{id}")
    fun buscarPorId(@PathVariable id:Long): TopicoView{
        return service.buscarPorId(id)
    }
    @PostMapping
    fun cadastrar(@RequestBody @Valid dto: NovoTopicoForm) {
        return service.cadastrar(dto)
    }
}