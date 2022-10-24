fun main(){
    println("Bem vindo ao Bytebank")
    val conta = Conta()
    conta.titular = "Alex"
    println(conta.titular)
//    val titular: String = "Alex"
//    val numeroConta: Int = 1000
//    var saldo = 0.0
//    saldo = 100 + 2.0
//    saldo += 200
//    saldo -=1000
//
//    println("titular $titular")
//    println("número da conta $numeroConta")
//    println("saldo da conta $saldo")
//    testaCondicoes(saldo)
}

class Conta {
    var titular: String = ""
    var numeroConta: String = ""
    var saldoConta: Double = 0.0
}


fun testaCondicoes(saldo: Double){
    when{
        saldo > 0.0 -> println("Conta com saldo positivo")
        saldo == 0.0 -> println("Conta com saldo neutro")
        else -> println("Conta com saldo negativo")
    }
}