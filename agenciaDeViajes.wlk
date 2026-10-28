
class Pack {

    var pack

    method pack() = pack

    var precioBase

    method precioBase() = precioBase

    var beneficios = []

    method beneficios() = beneficios

    method costoTotalBeneficio(){
        return beneficios.sum({unBeneficio => unBeneficio.costo()})
    }

    method aplicarRecargoSiEsInternacional(){
        if(pack.esInternacional() == true){ //no encontre otra forma
            return 20
        } else{
            return 0
        }
    }

    method valorFinalDePack(){
        return
            self.precioBase() +
            self.costoTotalBeneficio() +
            self.aplicarRecargoSiEsInternacional()
    }

}

//recordar los contenidos de los apuntes de wollok del dia 27/7/2026
class PackNacional {

    method esInternacional() = false

    var provincia

    method provincia() = provincia

    var actividades = []

    method actividades() = actividades.map({unaActividad => unaActividad})

}

class PackInternacional {

    method esInternacional() = true

    var pais

    method pais() = pais

    var cantidadDeEscalas

    method cantidadDeEscalas() = cantidadDeEscalas

    var esLugarDeInteres

    method esLugarDeInteres() = esLugarDeInteres

}

class Coordinador {

    var grupo

    method grupo() = grupo

    var cantidadDeViajesRealizados

    method cantidadDeViajesRealizados() = cantidadDeViajesRealizados

    var estaMotivado

    method estaMotivado() = estaMotivado

    var añosDeExperiencia

    method añosDeExperiencia() = añosDeExperiencia

    var rol = ""

    method rol() = rol

    method roles() = ["guia","asistenteLogistico","acompañante"]

    method cambiarRol(nuevoRol){
        if(self.roles().contains(nuevoRol)){
            rol = nuevoRol
        } else{
            self.error("rol no existente")
        }
    }

    method esAltamenteCalificado() = self.cantidadDeViajesRealizados() > 20

}

//rol

class Guia {

    var estaMotivado

    method estaMotivado() = estaMotivado

    method cumpleCondicion() = self.estaMotivado()

}

class AsistenteLogistico {

    var añosDeExperiencia

    method añosDeExperiencia() = añosDeExperiencia

    method cumpleCondicion() = self.añosDeExperiencia() >= 3

}

class Acompañante {
    method cumpleCondicion() = true
}

//beneficios

object trasladoPrivado {

    var nombre = "trasladoPrivado"

    method nombre() = nombre

    var costo = 6900

    method costo() = costo

    var estaVigente = true

    method estaVigente() = estaVigente

}

object salaVip {

    var nombre = "salaVip"

    method nombre() = nombre

    var costo = 3200

    method costo() = costo

    var estaVigente = false

    method estaVigente() = estaVigente

}

object seguroAdicional {

    var nombre = "seguroAdicional"

    method nombre() = nombre

    var costo = 4700

    method costo() = costo

    var estaVigente = true

    method estaVigente() = estaVigente

}



//

const corrientes =
    new PackNacional(
        provincia = "corrientes",
        actividades = ["caminar","saltar","frenar"]
    )

const italia =
    new PackInternacional(
        pais = "italia",
        cantidadDeEscalas = 9,
        esLugarDeInteres = true
    )


const albertoCoordinador =
    new Coordinador(
        grupo = "rojo",
        cantidadDeViajesRealizados = 25,
        estaMotivado = true,
        añosDeExperiencia = 3
    )
