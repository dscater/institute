<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Cursos > Mis Cursos > Solicitudes</h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-md-3">
                        <router-link
                            :to="{ name: 'estudiante_cursos.index' }"
                            class="btn btn-default btn-block btn-flat"
                            ><i class="fa fa-arrow-left"></i>
                            Volver</router-link
                        >
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="row">
                            <div class="col-md-12">
                                <h4 class="w-100 text-left">
                                    Información Estudiante
                                </h4>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <b-row class="mb-2">
                                    <b-col sm="5" class="text-sm-right"
                                        ><b>Nro. Inscripción:</b></b-col
                                    >
                                    <b-col>{{ oInscripcion.id }}</b-col>
                                </b-row>
                                <b-row class="mb-2">
                                    <b-col sm="5" class="text-sm-right"
                                        ><b>Nombre Estudiante:</b></b-col
                                    >
                                    <b-col>{{ oInscripcion.full_name }}</b-col>
                                </b-row>
                                <b-row class="mb-2">
                                    <b-col sm="5" class="text-sm-right"
                                        ><b>Nro. de identificación:</b></b-col
                                    >
                                    <b-col>{{ oInscripcion.nro_iden }}</b-col>
                                </b-row>
                                <b-row class="mb-2">
                                    <b-col sm="5" class="text-sm-right"
                                        ><b>Fecha de nacimiento:</b></b-col
                                    >
                                    <b-col>{{ oInscripcion.fecha_nac }}</b-col>
                                </b-row>
                                <b-row class="mb-2">
                                    <b-col sm="5" class="text-sm-right"
                                        ><b>Edad:</b></b-col
                                    >
                                    <b-col>{{ oInscripcion.edad }}</b-col>
                                </b-row>
                                <b-row class="mb-2">
                                    <b-col sm="5" class="text-sm-right"
                                        ><b>País de residencia:</b></b-col
                                    >
                                    <b-col>{{
                                        oInscripcion.pais_residencia
                                    }}</b-col>
                                </b-row>
                                <b-row class="mb-2">
                                    <b-col sm="5" class="text-sm-right"
                                        ><b>Nacionalidad:</b></b-col
                                    >
                                    <b-col>{{
                                        oInscripcion.nacionalidad
                                    }}</b-col>
                                </b-row>
                                <b-row class="mb-2">
                                    <b-col sm="5" class="text-sm-right"
                                        ><b>Provincia/Departamento:</b></b-col
                                    >
                                    <b-col>{{ oInscripcion.prov_dpto }}</b-col>
                                </b-row>
                                <b-row class="mb-2">
                                    <b-col sm="5" class="text-sm-right"
                                        ><b>Sexo:</b></b-col
                                    >
                                    <b-col>{{ oInscripcion.sexo }}</b-col>
                                </b-row>
                                <b-row class="mb-2">
                                    <b-col sm="5" class="text-sm-right"
                                        ><b>Celular:</b></b-col
                                    >
                                    <b-col>{{ oInscripcion.fono }}</b-col>
                                </b-row>
                                <b-row class="mb-2">
                                    <b-col sm="5" class="text-sm-right"
                                        ><b>Correo:</b></b-col
                                    >
                                    <b-col>{{ oInscripcion.correo }}</b-col>
                                </b-row>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-md-12">
                                <h4 class="w-100 text-left">Solicitudes</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div
                                class="col-md-6"
                                v-for="item in oInscripcion.inscripcion_solicituds"
                            >
                                <div class="card">
                                    <div class="card-body">
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b>Código solicitud:</b></b-col
                                            >
                                            <b-col>{{ item.id }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b>Curso:</b></b-col
                                            >
                                            <b-col>{{
                                                item.curso.nombre
                                            }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b
                                                    >Nivel seleccionado:</b
                                                ></b-col
                                            >
                                            <b-col>{{ item.nivel }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b
                                                    >Se entero del curso por:</b
                                                ></b-col
                                            >
                                            <b-col>
                                                <span
                                                    v-if="
                                                        item.se_entero != 'OTRO'
                                                    "
                                                    >{{ item.se_entero }}</span
                                                >
                                                <span v-else>{{
                                                    item.desc_se_entero
                                                }}</span>
                                            </b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b
                                                    >Plan seleccionado:</b
                                                ></b-col
                                            >
                                            <b-col>{{
                                                item.plan_pago.titulo
                                            }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b>Forma de Pago:</b></b-col
                                            >
                                            <b-col>
                                                <span>{{
                                                    item.forma_pago
                                                }}</span>
                                                <!-- <span
                                                    class="cursor-pointer"
                                                    @click="
                                                        muestraInfoFormaPago(
                                                            item
                                                        )
                                                    "
                                                    ><i
                                                        class="fa fa-info-circle"
                                                    ></i></span> -->
                                            </b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b
                                                    >Comprobante de pago:</b
                                                ></b-col
                                            >
                                            <b-col>
                                                <a
                                                    :href="item.url_archivo"
                                                    target="_blank"
                                                    >Ver comprobante</a
                                                >
                                            </b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b>Estado solicitud:</b></b-col
                                            >
                                            <b-col
                                                ><span
                                                    class="badge"
                                                    :class="{
                                                        'badge-success':
                                                            item.estado ==
                                                            'ACEPTADO',
                                                        'badge-info':
                                                            item.estado ==
                                                            'NO RESPONDE',
                                                        'badge-warning':
                                                            item.estado ==
                                                            'DESCARTADO',
                                                        'badge-danger':
                                                            item.estado ==
                                                            'PENDIENTE',
                                                    }"
                                                    >{{ item.estado }}</span
                                                ></b-col
                                            >
                                        </b-row>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <InfoFormaPago
            :muestra_modal="muestra_modal"
            :inscripcion_solicitud="oInscripcionSolicitud"
            @close="
                muestra_modal = false;
                oInscripcionSolicitud = null;
            "
        ></InfoFormaPago>
    </div>
</template>

<script>
import InfoFormaPago from "../inscripcions/InfoFormaPago.vue";
export default {
    props: ["id"],
    components: {
        InfoFormaPago,
    },
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            oInscripcion: {
                id: 0,
                user_id: "",
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
                inscripcion_solicituds: [],
            },
            oInscripcionSolicitud: null,
            muestra_modal: false,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getInscripcion();
    },
    methods: {
        getInscripcion() {
            this.muestra_modal = false;
            let url = main_url + "/admin/inscripcions/" + this.id;
            axios.get(url).then((res) => {
                this.oInscripcion = res.data.inscripcion;
            });
        },
        muestraInfoFormaPago(item) {
            this.oInscripcionSolicitud = item;
            this.muestra_modal = true;
        },
    },
};
</script>

<style></style>
