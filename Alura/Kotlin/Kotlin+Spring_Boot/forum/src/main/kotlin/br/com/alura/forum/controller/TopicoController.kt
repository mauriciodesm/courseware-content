package br.com.alura.forum.controller

import br.com.alura.forum.DTO.AtualizacaoTopicoForm
import br.com.alura.forum.DTO.NovoTopicoForm
import br.com.alura.forum.DTO.TopicoView
import br.com.alura.forum.service.TopicoService
import org.springframework.http.ResponseEntity
import org.springframework.transaction.annotation.Transactional
import org.springframework.web.bind.annotation.DeleteMapping
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.PutMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.util.UriComponentsBuilder
import javax.validation.Valid

@RestController
@RequestMapping("/topicos")
class TopicoController(private val service: TopicoService) {

    @GetMapping
    fun listar(): List<TopicoView>{
        return service.listar()
    }

    @GetMapping("/{id}")
    fun buscarPorId(@PathVariable id:Long): TopicoView {
        return service.buscarPorId(id)
    }
    @PostMapping
    @Transactional
    fun cadastrar(uriBuilder:UriComponentsBuilder,
        @RequestBody @Valid form: NovoTopicoForm): ResponseEntity<TopicoView>{
        val topicoView = service.cadastrar(form)
        val uri = uriBuilder.path("/topicos/${topicoView.id}").build().toUri()
        return  ResponseEntity.created(uri).body(topicoView)
    }
    @Transactional
    @PutMapping
    fun atualizar(@RequestBody @Valid form: AtualizacaoTopicoForm): ResponseEntity<TopicoView>{
        val topicoView= service.atualizar(form)
        return ResponseEntity.ok(topicoView)
    }

    @Transactional
    @DeleteMapping("/{id}")
    fun deletar (@PathVariable id: Long) {
        service.deletar(id)
    }
}