
class Pack {

    var coordinador

    method coordinador() = coordinador

    var duracion

    method duracion() = duracion

    var precio

    method precio() = precio

    const beneficios = []

    method beneficios() = beneficios

    method valorFinal() {
        return
            precio +
            beneficios.sum({ beneficio => beneficio.costo()})
    }

    method esPremium()
}

class PackNacional inherits Pack {

    var provincia

    method provincia() = provincia

    const actividades = []

    method actividades() = actividades

    override method esPremium() = self.duracion() > 10 and coordinador.esAltamenteCalificado()

}

class PackInternacional inherits Pack {

    var pais

    method pais() = pais

    var cantidadDeEscalas

    method cantidadDeEscalas() = cantidadDeEscalas

    var esLugarDeInteres

    method esLugarDeInteres() = esLugarDeInteres

    override method valorFinal() = super() * 1.20

    override method esPremium() = self.esLugarDeInteres() and self.duracion() > 20 and self.cantidadDeEscalas() == 0

}

class Coordinador {

    var rol

    method rol() = rol

    var estaMotivado

    method estaMotivado() = estaMotivado

    var viajesRealizados = 0

    method viajesRealizados() = viajesRealizados

    var añosDeExperiencia = 0

    method añosDeExperiencia() = añosDeExperiencia

    const rolesPermitidos = [guia, asistenteLogico, acompaniante]

    method rolesPermitidos() = rolesPermitidos

    method esAltamenteCalificado() = self.viajesRealizados() > 20 and self.rol().condicion(self)

    method asignarRol(nuevoRol) {
        if(not rolesPermitidos.contains(nuevoRol)) {
            self.error("Ese rol no esta permitido")
        }
        rol = nuevoRol
    }

}

//

object guia {
    method condicion(coordinador) = coordinador.estaMotivado()
}
object asistenteLogico {
    method condicion(coordinador) = coordinador.añosDeExperiencia() >= 3
}
object acompaniante {
    method condicion(coordinador) = true
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
