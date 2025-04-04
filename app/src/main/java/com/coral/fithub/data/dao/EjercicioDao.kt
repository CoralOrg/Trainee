package com.coral.fithub.data.dao

import androidx.room.*
import com.coral.fithub.data.model.Ejercicio

@Dao
interface EjercicioDao {

    @Insert
    suspend fun insert(ejercicio: Ejercicio)

    @Update
    suspend fun update(ejercicio: Ejercicio)

    @Delete
    suspend fun delete(ejercicio: Ejercicio)

    @Query("SELECT * FROM Ejercicio WHERE idEjercicio = :id")
    suspend fun get(id: Int): Ejercicio

    @Query("SELECT * FROM ejercicio")
    suspend fun getAll(): List<Ejercicio>
    
//    Obtiene todos los ejercicios de una rutina
    @Query("SELECT * FROM Ejercicio WHERE idEjercicio IN (SELECT idEjercicio FROM rutinaejercicio WHERE idRutina = :rutinaId)")
    suspend fun getEjerciciosPorRutina(rutinaId: Int): List<Ejercicio>
}