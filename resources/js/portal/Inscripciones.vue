<template>
    <div class="contenedor_inscripciones">
        <!-- start banner Area -->
        <section
            class="navegacion banner-area relative about-banner"
            id="home"
            :style="
                'background:url(' +
                url_principal +
                '/imgs/imagennavegacion.png)'
            "
        >
            <div class="overlay overlay-bg"></div>
            <div class="container">
                <div
                    class="row d-flex align-items-center justify-content-center"
                >
                    <div class="about-content col-lg-12">
                        <h1 class="text-white">Inscripciones</h1>
                        <p class="text-white link-nav">
                            <router-link :to="{ name: 'portal.inicio' }"
                                >Inicio
                            </router-link>
                            <span class="lnr lnr-arrow-right"></span>
                            <span>Inscripciones</span>
                        </p>
                    </div>
                </div>
            </div>
        </section>
        <!-- End banner Area -->

        <section class="popular-course-area section-gap pt-4">
            <div class="container">
                <div class="row">
                    <!-- PASOS -->
                    <div
                        class="col-3 p-0 pt-3 contenedor_paso"
                        :class="{ activo: paso_actual == 1 }"
                    >
                        <button class="bg-secundario" @click="muevePaso(1)">
                            <span class="numero_paso">1</span>
                            <span class="texto_paso">Inscripción</span>
                        </button>
                    </div>
                    <div
                        class="col-3 p-0 pt-3 contenedor_paso"
                        :class="{ activo: paso_actual == 2 }"
                    >
                        <button class="bg-secundario" @click="muevePaso(2)">
                            <span class="numero_paso">2</span>
                            <span class="texto_paso">Elegir Curso</span>
                        </button>
                    </div>
                    <div
                        class="col-3 p-0 pt-3 contenedor_paso"
                        :class="{ activo: paso_actual == 3 }"
                    >
                        <button class="bg-secundario" @click="muevePaso(3)">
                            <span class="numero_paso">3</span>
                            <span class="texto_paso">Pago</span>
                        </button>
                    </div>
                    <div
                        class="col-3 p-0 pt-3 contenedor_paso"
                        :class="{ activo: paso_actual == 4 }"
                    >
                        <button class="bg-secundario" @click="muevePaso(4)">
                            <span class="numero_paso">4</span>
                            <span class="texto_paso">Finalizar</span>
                        </button>
                    </div>
                    <!-- FORMULARIO -->
                    <div class="col-md-12 p-0 contenedor_forms">
                        <div class="card bg-secundario2 mb-5">
                            <div class="card-header bg-principal2">
                                <h4 class="title">{{ txtPaso }}</h4>
                            </div>
                            <!-- PASO 1 -->
                            <div class="card-body" v-if="paso_actual == 1">
                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger': errors.nombres,
                                            }"
                                            >Nombre completo*:</label
                                        >
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                            v-model="oInscripcion.nombres"
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.nombres"
                                            v-text="errors.nombres[0]"
                                        ></span>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger': errors.apellidos,
                                            }"
                                            >Apellido completo*:</label
                                        >
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                            v-model="oInscripcion.apellidos"
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.apellidos"
                                            v-text="errors.apellidos[0]"
                                        ></span>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger': errors.nro_iden,
                                            }"
                                            >Nro. Identificación
                                            (CI/DNI)*:</label
                                        >
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                            v-model="oInscripcion.nro_iden"
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.nro_iden"
                                            v-text="errors.nro_iden[0]"
                                        ></span>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger': errors.fecha_nac,
                                            }"
                                            >Fecha de Nacimiento*:</label
                                        >
                                        <input
                                            type="date"
                                            class="form-control w-full"
                                            v-model="oInscripcion.fecha_nac"
                                            @change="calculaEdad"
                                            @keyup="calculaEdad"
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.fecha_nac"
                                            v-text="errors.fecha_nac[0]"
                                        ></span>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger': errors.edad,
                                            }"
                                            >Edad*:</label
                                        >
                                        <input
                                            type="number"
                                            class="form-control w-full"
                                            readonly
                                            v-model="oInscripcion.edad"
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.edad"
                                            v-text="errors.edad[0]"
                                        ></span>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.pais_residencia,
                                            }"
                                            >País de Residencia*:</label
                                        >
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                            v-model="
                                                oInscripcion.pais_residencia
                                            "
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.pais_residencia"
                                            v-text="errors.pais_residencia[0]"
                                        ></span>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.nacionalidad,
                                            }"
                                            >Nacionalidad:</label
                                        >
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                            v-model="oInscripcion.nacionalidad"
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.nacionalidad"
                                            v-text="errors.nacionalidad[0]"
                                        ></span>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger': errors.prov_dpto,
                                            }"
                                            >Provincia/Departamento*:</label
                                        >
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                            v-model="oInscripcion.prov_dpto"
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.prov_dpto"
                                            v-text="errors.prov_dpto[0]"
                                        ></span>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger': errors.sexo,
                                            }"
                                            >Sexo*:</label
                                        >
                                        <select
                                            type="text"
                                            class="form-control w-full"
                                            v-model="oInscripcion.sexo"
                                        >
                                            <option value="">
                                                - Seleccione -
                                            </option>
                                            <option value="HOMBRE">
                                                HOMBRE
                                            </option>
                                            <option value="MUJER">MUJER</option>
                                        </select>
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.sexo"
                                            v-text="errors.sexo[0]"
                                        ></span>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger': errors.fono,
                                            }"
                                            >Celular*:</label
                                        >
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                            v-model="oInscripcion.fono"
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.fono"
                                            v-text="errors.fono[0]"
                                        ></span>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger': errors.correo,
                                            }"
                                            >Email*:</label
                                        >
                                        <input
                                            type="email"
                                            class="form-control w-full"
                                            v-model="oInscripcion.correo"
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.correo"
                                            v-text="errors.correo[0]"
                                        ></span>
                                    </div>
                                </div>
                            </div>
                            <!-- PASO 2 -->
                            <div class="card-body" v-if="paso_actual == 2">
                                <div class="row">
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger': errors.curso_id,
                                            }"
                                            >Seleccionar Curso*:</label
                                        >
                                        <select
                                            class="form-control"
                                            :class="{
                                                'is-invalid': errors.curso_id,
                                            }"
                                            v-model="oInscripcion.curso_id"
                                            filterable
                                            clearable
                                        >
                                            <option
                                                v-for="item in listCursos"
                                                :key="item.id"
                                                :value="item.id"
                                                :label="item.nombre"
                                            ></option>
                                        </select>
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.curso_id"
                                            v-text="errors.curso_id[0]"
                                        ></span>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger': errors.nivel,
                                            }"
                                            >Elige el nivel en el que
                                            estas*:</label
                                        >
                                        <select
                                            class="form-control"
                                            :class="{
                                                'is-invalid': errors.nivel,
                                            }"
                                            v-model="oInscripcion.nivel"
                                            filterable
                                            clearable
                                        >
                                            <option
                                                v-for="item in listNiveles"
                                                :key="item"
                                                :value="item"
                                                :label="item"
                                            ></option>
                                        </select>
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.nivel"
                                            v-text="errors.nivel[0]"
                                        ></span>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger': errors.se_entero,
                                            }"
                                            >Como se entero del Curso*:</label
                                        >
                                        <select
                                            class="form-control"
                                            :class="{
                                                'is-invalid': errors.se_entero,
                                            }"
                                            v-model="oInscripcion.se_entero"
                                            filterable
                                            clearable
                                        >
                                            <option
                                                v-for="item in listSeEntero"
                                                :key="item"
                                                :value="item"
                                                :label="item"
                                            ></option>
                                        </select>
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.se_entero"
                                            v-text="errors.se_entero[0]"
                                        ></span>
                                    </div>
                                    <div
                                        class="form-group col-md-4"
                                        v-if="oInscripcion.se_entero == 'OTRO'"
                                    >
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.desc_se_entero,
                                            }"
                                            >Describir otro*:</label
                                        >
                                        <input
                                            type="email"
                                            class="form-control w-full"
                                            v-model="
                                                oInscripcion.desc_se_entero
                                            "
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.desc_se_entero"
                                            v-text="errors.desc_se_entero[0]"
                                        ></span>
                                    </div>
                                </div>
                            </div>
                            <!-- PASO 3 -->
                            <div class="card-body" v-if="paso_actual == 3">
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.plan_pago_id,
                                            }"
                                            >Seleccionar plan de pago*:</label
                                        >
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div
                                                    class="card plan_pago mb-2"
                                                    :class="{
                                                        activo:
                                                            oInscripcion.plan_pago_id ==
                                                            1,
                                                    }"
                                                >
                                                    <div
                                                        class="card-body"
                                                        @click="
                                                            setIdPlanPago(
                                                                plan_mensual.id
                                                            )
                                                        "
                                                    >
                                                        <div class="titulo">
                                                            {{
                                                                plan_mensual.titulo
                                                            }}
                                                        </div>
                                                        <div class="costo">
                                                            $us
                                                            {{
                                                                plan_mensual.costo
                                                            }}
                                                        </div>
                                                        <p
                                                            class="detalle"
                                                            v-html="
                                                                plan_mensual.detalles
                                                            "
                                                        ></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div
                                                    class="card plan_pago mb-2"
                                                    :class="{
                                                        activo:
                                                            oInscripcion.plan_pago_id ==
                                                            3,
                                                    }"
                                                >
                                                    <div
                                                        class="card-body"
                                                        @click="
                                                            setIdPlanPago(
                                                                plan_anual.id
                                                            )
                                                        "
                                                    >
                                                        <div class="titulo">
                                                            {{
                                                                plan_anual.titulo
                                                            }}
                                                        </div>
                                                        <div class="costo">
                                                            $us
                                                            {{
                                                                plan_anual.costo
                                                            }}
                                                        </div>
                                                        <p
                                                            class="detalle"
                                                            v-html="
                                                                plan_anual.detalles
                                                            "
                                                        ></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div
                                                    class="card plan_pago mb-2"
                                                    :class="{
                                                        activo:
                                                            oInscripcion.plan_pago_id ==
                                                            2,
                                                    }"
                                                >
                                                    <div
                                                        class="card-body"
                                                        @click="
                                                            setIdPlanPago(
                                                                plan_trimestral.id
                                                            )
                                                        "
                                                    >
                                                        <div class="titulo">
                                                            {{
                                                                plan_trimestral.titulo
                                                            }}
                                                        </div>
                                                        <div class="costo">
                                                            $us
                                                            {{
                                                                plan_trimestral.costo
                                                            }}
                                                        </div>
                                                        <p
                                                            class="detalle"
                                                            v-html="
                                                                plan_trimestral.detalles
                                                            "
                                                        ></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.forma_pago,
                                            }"
                                            >Seleccionar forma de pago*:</label
                                        >
                                        <select
                                            class="form-control"
                                            :class="{
                                                'is-invalid': errors.forma_pago,
                                            }"
                                            v-model="oInscripcion.forma_pago"
                                            filterable
                                            clearable
                                        >
                                            <option
                                                v-for="item in listFormaPagos"
                                                :key="item"
                                                :value="item"
                                                :label="item"
                                            ></option>
                                        </select>
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.forma_pago"
                                            v-text="errors.forma_pago[0]"
                                        ></span>
                                    </div>
                                    <div
                                        class="col-md-4"
                                        v-if="
                                            oInscripcion.forma_pago == 'ZELLE'
                                        "
                                    >
                                        <p
                                            class="w-100 border border-white rounded p-3 mb-2"
                                            v-html="
                                                informacion_zelle.descripcion
                                            "
                                        ></p>
                                        <template
                                            v-if="
                                                informacion_zelle.tipo_archivo ==
                                                'imagen'
                                            "
                                        >
                                            <div
                                                class="w-100 text-center contenedor_imagen_forma_pago"
                                            >
                                                <img
                                                    width="320px"
                                                    :src="
                                                        informacion_zelle.url_archivo
                                                    "
                                                    alt=""
                                                />
                                            </div>
                                        </template>
                                        <a
                                            :href="
                                                informacion_zelle.url_archivo
                                            "
                                            target="_blank"
                                            v-else
                                            >Ver archivo</a
                                        >
                                    </div>
                                    <div
                                        class="col-md-4"
                                        v-if="
                                            oInscripcion.forma_pago ==
                                            'WESTERN UNION'
                                        "
                                    >
                                        <p
                                            class="w-100 border border-white rounded p-3 mb-2"
                                            v-html="
                                                informacion_western.descripcion
                                            "
                                        ></p>
                                        <template
                                            v-if="
                                                informacion_western.tipo_archivo ==
                                                'imagen'
                                            "
                                        >
                                            <div
                                                class="w-100 text-center contenedor_imagen_forma_pago"
                                            >
                                                <img
                                                    width="320px"
                                                    :src="
                                                        informacion_western.url_archivo
                                                    "
                                                    alt=""
                                                />
                                            </div>
                                        </template>
                                        <a
                                            :href="
                                                informacion_western.url_archivo
                                            "
                                            v-else
                                            >Ver archivo</a
                                        >
                                    </div>
                                    <div
                                        class="col-md-4"
                                        v-if="
                                            oInscripcion.forma_pago ==
                                            'DEPÓSITO BANCARIO'
                                        "
                                    >
                                        <p
                                            class="w-100 border border-white rounded p-3 mb-2"
                                            v-html="
                                                informacion_deposito.descripcion
                                            "
                                        ></p>
                                        <template
                                            v-if="
                                                informacion_deposito.tipo_archivo ==
                                                'imagen'
                                            "
                                        >
                                            <div
                                                class="w-100 text-center contenedor_imagen_forma_pago"
                                            >
                                                <img
                                                    width="320px"
                                                    :src="
                                                        informacion_deposito.url_archivo
                                                    "
                                                    alt=""
                                                />
                                            </div>
                                        </template>
                                        <a
                                            :href="
                                                informacion_deposito.url_archivo
                                            "
                                            v-else
                                            >Ver archivo</a
                                        >
                                    </div>
                                    <div
                                        class="col-md-4"
                                        v-if="
                                            oInscripcion.forma_pago ==
                                            'MERCADO PAGO'
                                        "
                                    >
                                        <p
                                            class="w-100 border border-white rounded p-3 mb-2"
                                            v-html="
                                                informacion_mercado.descripcion
                                            "
                                        ></p>
                                        <template
                                            v-if="
                                                informacion_mercado.tipo_archivo ==
                                                'imagen'
                                            "
                                        >
                                            <div
                                                class="w-100 text-center contenedor_imagen_forma_pago"
                                            >
                                                <img
                                                    width="320px"
                                                    :src="
                                                        informacion_mercado.url_archivo
                                                    "
                                                    alt=""
                                                />
                                            </div>
                                        </template>
                                        <a
                                            :href="
                                                informacion_mercado.url_archivo
                                            "
                                            v-else
                                            >Ver archivo</a
                                        >
                                    </div>
                                    <div
                                        class="col-md-4"
                                        v-if="
                                            oInscripcion.forma_pago ==
                                            'OTRAS FORMAS DE PAGO'
                                        "
                                    >
                                        <p
                                            class="w-100 border border-white rounded p-3 mb-2"
                                            v-html="
                                                informacion_otros.descripcion
                                            "
                                        ></p>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.archivo_pago,
                                            }"
                                            >Adjuntar comprobante*:</label
                                        >
                                        <input
                                            type="file"
                                            class="form-control w-full"
                                            ref="archivo_pago"
                                            @change="cargarArchivo"
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.archivo_pago"
                                            v-text="errors.archivo_pago[0]"
                                        ></span>
                                    </div>
                                </div>
                            </div>
                            <!-- PASO 4 -->
                            <div class="card-body" v-if="paso_actual == 4">
                                <div class="row">
                                    <div class="form-group col-md-12">
                                        <label
                                            >Creación de cuenta
                                            estudiante</label
                                        >
                                    </div>
                                    <div class="form-group col-12">
                                        <label
                                            :class="{
                                                'text-danger': errors.correo,
                                            }"
                                            >Usuario
                                            <small>(Correo - Paso 1)</small
                                            >*:</label
                                        >
                                        <input
                                            type="text"
                                            class="form-control w-full"
                                            v-model="oInscripcion.correo"
                                            readonly
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.correo"
                                            v-text="errors.correo[0]"
                                        ></span>
                                    </div>
                                    <div class="form-group col-12">
                                        <label
                                            :class="{
                                                'text-danger': errors.password,
                                            }"
                                            >Contraseña
                                            <small>(minímo 8 caracteres)</small
                                            >*:</label
                                        >
                                        <input
                                            type="password"
                                            class="form-control w-full"
                                            v-model="oInscripcion.password"
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.password"
                                            v-text="errors.password[0]"
                                        ></span>
                                    </div>
                                    <div class="form-group col-12">
                                        <label
                                            :class="{
                                                'text-danger':
                                                    errors.password_confirmation,
                                            }"
                                            >Repite la contraseña*:</label
                                        >
                                        <input
                                            type="password"
                                            class="form-control w-full"
                                            v-model="
                                                oInscripcion.password_confirmation
                                            "
                                        />
                                        <span
                                            class="error invalid-feedback d-block"
                                            v-if="errors.password_confirmation"
                                            v-text="
                                                errors.password_confirmation[0]
                                            "
                                        ></span>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="row">
                                    <div class="col-6">
                                        <button
                                            v-if="paso_actual > 1"
                                            class="btn btn-success btn-block btn-flat"
                                            @click="cambiaPaso(-1)"
                                        >
                                            <span
                                                class="lnr lnr-arrow-left text-white"
                                            ></span>
                                            Anterior
                                        </button>
                                    </div>
                                    <div
                                        class="col-6"
                                        v-if="paso_actual < total_pasos"
                                    >
                                        <button
                                            class="btn btn-success btn-block btn-flat"
                                            @click="cambiaPaso(1)"
                                        >
                                            Siguiente
                                            <span
                                                class="lnr lnr-arrow-right text-white"
                                            ></span>
                                        </button>
                                    </div>
                                    <div
                                        class="col-6"
                                        v-if="paso_actual == total_pasos"
                                    >
                                        <button
                                            class="btn btn-success btn-block btn-flat"
                                            :disabled="enviando"
                                            @click="realizarInscripcion"
                                            v-html="txtBtnFinalizar"
                                        ></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</template>
<script>
export default {
    data() {
        return {
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            url_principal: main_url,
            oInscripcion: {
                nombres: "",
                apellidos: "",
                nro_iden: "",
                fecha_nac: "",
                edad: "",
                pais_residencia: "",
                nacionalidad: "",
                prov_dpto: "",
                sexo: "",
                fono: "",
                correo: "",
                curso_id: "",
                nivel: "",
                se_entero: "",
                desc_se_entero: "",
                plan_pago_id: 3,
                forma_pago: "",
                archivo_pago: null,
                desc_pago: "",
                desc_otro_pago: "",
                password: "",
                password_confirmation: "",
            },
            plan_mensual: {
                id: 0,
                titulo: "PLAN MENSUAL",
                costo: "0",
                detalles: "",
            },
            plan_trimestral: {
                id: 0,
                titulo: "PLAN TRIMESTRAL",
                costo: "0",
                detalles: "",
            },
            plan_anual: {
                id: 0,
                titulo: "PLAN ANUAL",
                costo: "0",
                detalles: "",
            },
            informacion_zelle: {
                url_archivo: "",
                archivo: null,
                descripcion: "Pago zelle\nDescripción pago zelle",
            },
            informacion_western: {
                url_archivo: "",
                archivo: null,
                descripcion: "Pago western union\nDescripción pago western",
            },
            informacion_deposito: {
                url_archivo: main_url + "/imgs/qr_institute.png",
                archivo: null,
                descripcion:
                    "Deposito bancario\nNro. de cuenta: 100000000000000000000000",
            },
            informacion_mercado: {
                url_archivo: "",
                archivo: null,
                descripcion:
                    "Mercado pago Argentina\nJuan Perez\nCVU: 00000333333333\nAlias: Tomorrowistoday\nCUIT/CUIL: 2000999999\nMercado Pago",
            },
            informacion_otros: {
                descripcion:
                    "Otros tipos de pagos\nDescripción de otros tipos de pagos",
            },
            paso_actual: 1,
            total_pasos: 4,
            listCursos: [],
            listNiveles: [
                "NIVEL CERO",
                "NIVEL BÁSICO",
                "NIVEL INTERMEDIO",
                "NIVEL AVANZADO",
            ],
            listSeEntero: [
                "INSTAGRAM",
                "FACEBOOK",
                "TIKTOK",
                "YOUTUBE",
                "OTRO",
            ],
            listFormaPagos: [
                "ZELLE",
                "WESTERN UNION",
                "DEPÓSITO BANCARIO",
                "MERCADO PAGO",
                "OTRAS FORMAS DE PAGO",
            ],
            errors: [],
            enviando: false,
        };
    },
    computed: {
        txtPaso() {
            switch (this.paso_actual) {
                case 1:
                    return "Inscripción";
                case 2:
                    return "Elegir Curso";
                case 3:
                    return "Pago";
                case 4:
                    return "Finalizar";
            }
        },
        txtBtnFinalizar() {
            if (this.enviando) {
                return `Enviando <i class="fa fa-spinner fa-spin"></i>`;
            }
            return `Finalizar <span class="fa fa-flag-checkered text-white"></span>`;
        },
    },
    mounted() {
        this.getCursos();
        this.getPlanPago();
        this.loadingWindow.close();
    },
    methods: {
        getPlanPago() {
            let url = main_url + "/portal/get_plan_pagos";
            axios.get(url).then((res) => {
                if (res.data.plan_mensual) {
                    this.plan_mensual.id = res.data.plan_mensual.id;
                    this.plan_mensual.titulo = res.data.plan_mensual.titulo;
                    this.plan_mensual.costo = res.data.plan_mensual.costo;
                    this.plan_mensual.detalles = res.data.plan_mensual.detalles;
                }
                if (res.data.plan_trimestral) {
                    this.plan_trimestral.id = res.data.plan_trimestral.id;
                    this.plan_trimestral.titulo =
                        res.data.plan_trimestral.titulo;
                    this.plan_trimestral.costo = res.data.plan_trimestral.costo;
                    this.plan_trimestral.detalles =
                        res.data.plan_trimestral.detalles;
                }
                if (res.data.plan_anual) {
                    this.plan_anual.id = res.data.plan_anual.id;
                    this.plan_anual.titulo = res.data.plan_anual.titulo;
                    this.plan_anual.costo = res.data.plan_anual.costo;
                    this.plan_anual.detalles = res.data.plan_anual.detalles;
                }
                if (res.data.informacion_zelle) {
                    this.informacion_zelle = res.data.informacion_zelle;
                }
                if (res.data.informacion_western) {
                    this.informacion_western = res.data.informacion_western;
                }
                if (res.data.informacion_deposito) {
                    this.informacion_deposito = res.data.informacion_deposito;
                }
                if (res.data.informacion_mercado) {
                    this.informacion_mercado = res.data.informacion_mercado;
                }
                if (res.data.informacion_otros) {
                    this.informacion_otros = res.data.informacion_otros;
                }
            });
        },
        getCursos() {
            this.loading = true;
            axios.get(main_url + "/portal/getIndexCursos").then((response) => {
                this.listCursos = response.data.cursos;
            });
        },
        setIdPlanPago(id) {
            console.log(id);
            this.oInscripcion.plan_pago_id = id;
            console.log(this.oInscripcion.plan_pago_id);
        },
        cargarArchivo(e) {
            this.oInscripcion.archivo_pago = e.target.files[0];
        },
        realizarInscripcion() {
            this.enviando = true;
            try {
                this.textoBtn = "Enviando...";
                let url = main_url + "/portal/registrar_inscripcion";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                if (this.oInscripcion.nombres)
                    formdata.append("nombres", this.oInscripcion.nombres);
                if (this.oInscripcion.apellidos)
                    formdata.append("apellidos", this.oInscripcion.apellidos);
                if (this.oInscripcion.nro_iden)
                    formdata.append("nro_iden", this.oInscripcion.nro_iden);
                if (this.oInscripcion.fecha_nac)
                    formdata.append("fecha_nac", this.oInscripcion.fecha_nac);
                if (this.oInscripcion.edad)
                    formdata.append("edad", this.oInscripcion.edad);
                if (this.oInscripcion.pais_residencia)
                    formdata.append(
                        "pais_residencia",
                        this.oInscripcion.pais_residencia
                    );
                if (this.oInscripcion.nacionalidad)
                    formdata.append(
                        "nacionalidad",
                        this.oInscripcion.nacionalidad
                    );
                if (this.oInscripcion.prov_dpto)
                    formdata.append("prov_dpto", this.oInscripcion.prov_dpto);
                if (this.oInscripcion.sexo)
                    formdata.append("sexo", this.oInscripcion.sexo);
                if (this.oInscripcion.fono)
                    formdata.append("fono", this.oInscripcion.fono);
                if (this.oInscripcion.correo)
                    formdata.append("correo", this.oInscripcion.correo);
                if (this.oInscripcion.curso_id)
                    formdata.append("curso_id", this.oInscripcion.curso_id);
                if (this.oInscripcion.nivel)
                    formdata.append("nivel", this.oInscripcion.nivel);
                if (this.oInscripcion.se_entero)
                    formdata.append("se_entero", this.oInscripcion.se_entero);
                if (this.oInscripcion.desc_se_entero)
                    formdata.append(
                        "desc_se_entero",
                        this.oInscripcion.desc_se_entero
                    );
                if (this.oInscripcion.plan_pago_id)
                    formdata.append(
                        "plan_pago_id",
                        this.oInscripcion.plan_pago_id
                    );
                if (this.oInscripcion.forma_pago)
                    formdata.append("forma_pago", this.oInscripcion.forma_pago);
                if (this.oInscripcion.archivo_pago)
                    formdata.append(
                        "archivo_pago",
                        this.oInscripcion.archivo_pago
                    );
                // if (this.oInscripcion.desc_pago)
                //     formdata.append("desc_pago", this.oInscripcion.desc_pago);
                // if (this.oInscripcion.desc_otro_pago)
                //     formdata.append(
                //         "desc_otro_pago",
                //         this.oInscripcion.desc_otro_pago
                //     );
                if (this.oInscripcion.password)
                    formdata.append("password", this.oInscripcion.password);
                if (this.oInscripcion.password_confirmation)
                    formdata.append(
                        "password_confirmation",
                        this.oInscripcion.password_confirmation
                    );
                axios
                    .post(url, formdata, config)
                    .then((res) => {
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: true,
                            confirmButtonColor: "#009688",
                            confirmButtonText: "Aceptar",
                        });
                        this.errors = [];
                        this.limpiarInscripcion();
                        this.enviando = false;
                    })
                    .catch((error) => {
                        this.enviando = false;
                        if (error.response) {
                            if (error.response.status === 422) {
                                this.errors = error.response.data.errors;
                                let mensaje = `<ul class="text-center">`;
                                for (let key in this.errors) {
                                    if (this.errors.hasOwnProperty(key)) {
                                        const value = this.errors[key];
                                        if (Array.isArray(value)) {
                                            value.forEach((error) => {
                                                mensaje += `<li><span>${error.trim()}</span></li>`;
                                            });
                                        }
                                    }
                                }
                                mensaje += `<ul/>`;
                                Swal.fire({
                                    icon: "error",
                                    title: "Tienes los siguientes errores en el formulario",
                                    html: mensaje,
                                    showConfirmButton: true,
                                    confirmButtonColor: "#009688",
                                    confirmButtonText: "Aceptar",
                                });
                            }
                            if (
                                error.response.status === 420 ||
                                error.response.status === 419 ||
                                error.response.status === 401
                            ) {
                                window.location = "/";
                            }
                            if (error.response.status === 500) {
                                Swal.fire({
                                    icon: "error",
                                    title: "Error",
                                    html: error.response.data.message,
                                    showConfirmButton: true,
                                    confirmButtonColor: "#009688",
                                    confirmButtonText: "Aceptar",
                                });
                            }
                        }
                    });
            } catch (e) {
                this.enviando = false;
                console.log(e);
            }
        },
        limpiarInscripcion() {
            this.oInscripcion = {
                nombres: "",
                apellidos: "",
                nro_iden: "",
                fecha_nac: "",
                edad: "",
                pais_residencia: "",
                nacionalidad: "",
                prov_dpto: "",
                sexo: "",
                fono: "",
                correo: "",
                curso_id: "",
                nivel: "",
                se_entero: "",
                desc_se_entero: "",
                plan_pago_id: 3,
                forma_pago: "",
                archivo_pago: null,
                desc_pago: "",
                desc_otro_pago: "",
                password: "",
                password_confirmation: "",
            };
            this.$refs.archivo_pago.value = "";
        },
        calculaEdad() {
            if (this.oInscripcion.fecha_nac) {
                const fechaNac = new Date(this.oInscripcion.fecha_nac);
                // Obtenemos la fecha actual
                const fechaActual = new Date();

                // Calculamos la diferencia en milisegundos
                const diferencia = fechaActual - fechaNac;

                // Convertimos la diferencia en años
                const edad = Math.floor(
                    diferencia / (1000 * 60 * 60 * 24 * 365.25)
                );
                this.oInscripcion.edad = edad;
            } else {
                this.oInscripcion.edad = "";
            }
        },
        // PASOS
        muevePaso(paso) {
            this.paso_actual = paso;
        },
        cambiaPaso(cambio) {
            this.paso_actual = this.paso_actual + cambio;
            if (this.paso_actual < 0) {
                this.paso_actual = 1;
            }
            if (this.paso_actual > this.total_pasos) {
                this.paso_actual = this.total_pasos;
            }
        },
    },
};
</script>
<style>
.contenedor_imagen_forma_pago img {
    max-width: 100%;
}

.contenedor_inscripciones .contenedor_paso {
    text-align: center;
}
.contenedor_inscripciones .contenedor_paso button {
    text-align: center;
    background-color: transparent;
    color: white;
    height: auto;
    margin-bottom: 15px;
}

.contenedor_inscripciones .contenedor_paso.activo .numero_paso {
    background-color: var(--principal2);
}

.contenedor_inscripciones .contenedor_paso .numero_paso {
    border-radius: 50%;
    border: solid 1px;
    padding: 15px 19px;
}

.contenedor_inscripciones .contenedor_forms .card,
.contenedor_inscripciones .contenedor_forms .card .card-body {
    border-radius: 0px;
}
@media (max-width: 800px) {
    .contenedor_inscripciones .contenedor_paso .texto_paso {
        display: none;
    }
}

.contenedor_inscripciones .plan_pago {
    border-radius: 25px !important;
    color: var(--principal);
    transition: 0.25s all;
}

.contenedor_inscripciones .plan_pago:hover {
    cursor: pointer;
    background-color: var(--principal2);
    color: white;
}

.contenedor_inscripciones .plan_pago.activo {
    background-color: var(--principal2);
    color: white;
}

.contenedor_inscripciones .plan_pago .titulo {
    font-weight: bold;
    width: 100%;
    text-align: center;
    font-size: 1.5em;
    margin-bottom: 12px;
}

.contenedor_inscripciones .plan_pago .costo {
    font-weight: bold;
    width: 100%;
    text-align: center;
    background-color: var(--principal);
    color: white;
    font-size: 1.2em;
    border-radius: 30px;
    margin-bottom: 12px;
}

.contenedor_inscripciones .plan_pago .detalle {
    line-height: 28px;
    width: 100%;
    text-align: center;
    font-size: 1em;
}
</style>
