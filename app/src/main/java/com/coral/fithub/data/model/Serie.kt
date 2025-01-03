package com.coral.fithub.data.model

import androidx.room.*


@Entity(
    tableName = "Serie",
    foreignKeys = [
        ForeignKey(
            entity = Ejercicio::class,
            parentColumns = ["idEjercicio"],
            childColumns = ["idEjercicio"],
            onDelete = ForeignKey.CASCADE
        )
    ]
)
data class Serie (
    @PrimaryKey(autoGenerate = true)
    var idSerie: Int,

    var peso: Float?,

    var repeticiones: Int?,

    var idEjercicio:Int,

    var idEntrenamiento: Int
)