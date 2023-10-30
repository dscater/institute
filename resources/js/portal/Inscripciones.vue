<template>
    <div class="contenedor_inscripciones">
        <!-- start banner Area -->
        <section
            class="navegacion banner-area relative about-banner"
            id="home"
            :style="
                'background:url(' +
                url_principal +
                '/imgs/ImagenDeNavegaciónPortal.png)'
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

        <section class="popular-course-area section-gap pt-3">
            <div class="container">
                <div class="row">
                    <!-- PASOS -->
                    <div
                        class="col-3 p-0 contenedor_paso"
                        :class="{ activo: paso_actual == 1 }"
                    >
                        <button
                            class="btn btn-flat bg-secundario"
                            @click="muevePaso(1)"
                        >
                            <span class="numero_paso">1</span>
                            <span class="texto_paso">Inscripción</span>
                        </button>
                    </div>
                    <div
                        class="col-3 p-0 contenedor_paso"
                        :class="{ activo: paso_actual == 2 }"
                    >
                        <button
                            class="btn btn-flat bg-secundario"
                            @click="muevePaso(2)"
                        >
                            <span class="numero_paso">2</span>
                            <span class="texto_paso">Elegir Curso</span>
                        </button>
                    </div>
                    <div
                        class="col-3 p-0 contenedor_paso"
                        :class="{ activo: paso_actual == 3 }"
                    >
                        <button
                            class="btn btn-flat bg-secundario"
                            @click="muevePaso(3)"
                        >
                            <span class="numero_paso">3</span>
                            <span class="texto_paso">Pago</span>
                        </button>
                    </div>
                    <div
                        class="col-3 p-0 contenedor_paso"
                        :class="{ activo: paso_actual == 4 }"
                    >
                        <button
                            class="btn btn-flat bg-secundario"
                            @click="muevePaso(4)"
                        >
                            <span class="numero_paso">4</span>
                            <span class="texto_paso">Finalizar</span>
                        </button>
                    </div>
                    <!-- FORMULARIO -->
                    <div class="col-md-12 p-0 contenedor_forms">
                        <div class="card bg-secundario2">
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
                                            class="error invalid-feedback"
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
                                            class="error invalid-feedback"
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
                                            class="error invalid-feedback"
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
                                        />
                                        <span
                                            class="error invalid-feedback"
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
                                            class="error invalid-feedback"
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
                                            class="error invalid-feedback"
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
                                            class="error invalid-feedback"
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
                                            class="error invalid-feedback"
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
                                            class="error invalid-feedback"
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
                                            class="error invalid-feedback"
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
                                            class="error invalid-feedback"
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
                                            class="error invalid-feedback"
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
                                            class="error invalid-feedback"
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
                                            class="error invalid-feedback"
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
                                            class="error invalid-feedback"
                                            v-if="errors.desc_se_entero"
                                            v-text="errors.desc_se_entero[0]"
                                        ></span>
                                    </div>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="row">
                                    <div class="col-md-6">
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
                                    <div class="col-md-6">
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
                plan_pago: "",
                forma_pago: "",
                archivo_pago: "",
                desc_pago: "",
                desc_otro_pago: "",
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
            errors: [],
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
    },
    mounted() {
        this.getCursos();
        this.loadingWindow.close();
    },
    methods: {
        getCursos() {
            this.loading = true;
            axios.get(main_url + "/portal/getIndexCursos").then((response) => {
                this.listCursos = response.data.cursos;
            });
        },
        muevePaso(paso) {
            this.paso_actual = paso;
        },
        cambiaPaso(cambio) {
            this.paso_actual = this.paso_actual + cambio;
            if (this.paso_actual < 0) {
                this.paso_actual = 1;
            }
            if (this.paso_actual > total_pasos) {
                this.paso_actual = total_pasos;
            }
        },
    },
};
</script>
<style>
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
</style>
