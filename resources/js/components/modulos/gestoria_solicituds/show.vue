<template>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-12">
                        <h1>
                            Administración Gestoría de Visa > Solicitudes de
                            Servicio > Ver Solicitud
                        </h1>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-md-3">
                        <router-link
                            :to="{ name: 'gestoria_solicituds.index' }"
                            class="btn btn-default btn-block btn-flat"
                            ><i class="fa fa-arrow-left"></i>
                            Volver</router-link
                        >
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-12">
                                <h4 class="w-100 text-left">Solicitudes</h4>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b>Código solicitud:</b></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.codigo
                                            }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b>Nombre completo:</b></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.full_name
                                            }}</b-col>
                                        </b-row>

                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b
                                                    >Fecha de nacimiento:</b
                                                ></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.fecha_nac
                                            }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b>Edad:</b></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.edad
                                            }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b>Nacionalidad:</b></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.nacionalidad
                                            }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b>Estado:</b></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.estado
                                            }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b>Sexo:</b></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.sexo
                                            }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b>Celular:</b></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.fono
                                            }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b
                                                    >¿Tiene familiares en
                                                    Estados Unidos?:</b
                                                ></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.familiares_eeuu
                                            }}</b-col>
                                        </b-row>
                                        <b-row
                                            class="mb-2"
                                            v-if="
                                                oGestoriaSolSolicitud.familiares_eeuu ==
                                                'SI'
                                            "
                                        >
                                            <b-col sm="5" class="text-sm-right"
                                                ><b
                                                    >¿Cuál es el parentesco
                                                    familiar?:</b
                                                ></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.parentesco
                                            }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b
                                                    >¿Algún familiar fue
                                                    deportado de Estados
                                                    Unidos?:</b
                                                ></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.familiar_deportado
                                            }}</b-col>
                                        </b-row>
                                        <b-row
                                            class="mb-2"
                                            v-if="
                                                oGestoriaSolSolicitud.familiar_deportado ==
                                                'SI'
                                            "
                                        >
                                            <b-col sm="5" class="text-sm-right"
                                                ><b
                                                    >¿Cuál fue el motivo?:</b
                                                ></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.motivo
                                            }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b
                                                    >¿Fue deportado de algún
                                                    otro país?:</b
                                                ></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.deportado_otro_pais
                                            }}</b-col>
                                        </b-row>
                                        <b-row
                                            class="mb-2"
                                            v-if="
                                                oGestoriaSolSolicitud.familiar_deportado ==
                                                'SI'
                                            "
                                        >
                                            <b-col sm="5" class="text-sm-right"
                                                ><b
                                                    >¿Cuál fue el motivo?:</b
                                                ></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.motivo_otro_pais
                                            }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b
                                                    >¿Tiene antecedentes
                                                    penales?:</b
                                                ></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.antecedentes_penales
                                            }}</b-col>
                                        </b-row>
                                        <b-row
                                            class="mb-2"
                                            v-if="
                                                oGestoriaSolSolicitud.antecedentes_penales ==
                                                'OTRO'
                                            "
                                        >
                                            <b-col sm="5" class="text-sm-right"
                                                ><b>Describir:</b></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.desc_antecedentes
                                            }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b>Estudios:</b></b-col
                                            >
                                            <b-col
                                                v-html="
                                                    oGestoriaSolSolicitud.estudios
                                                "
                                            ></b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b
                                                    >Actualmente en que
                                                    trabaja:</b
                                                ></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.trabajo_actual
                                            }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b
                                                    >¿Alguna vez solicitó la
                                                    visa de Estados Unidos?:</b
                                                ></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.solicito_visa
                                            }}</b-col>
                                        </b-row>
                                        <b-row
                                            class="mb-2"
                                            v-if="
                                                oGestoriaSolSolicitud.solicito_visa ==
                                                'SI'
                                            "
                                        >
                                            <b-col sm="5" class="text-sm-right"
                                                ><b
                                                    >¿Por qué lo rechazarón?:</b
                                                ></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.motivo_rechazo
                                            }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b
                                                    >¿Tiene cuenta bancaria?:</b
                                                ></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.cuenta_bancaria
                                            }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b
                                                    >¿Cuantó gana
                                                    aproximadamente?:</b
                                                ></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.gana_aproximadamente
                                            }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b>Redes sociales:</b></b-col
                                            >
                                            <b-col
                                                v-html="
                                                    oGestoriaSolSolicitud.redes_sociales
                                                "
                                            ></b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b>Email:</b></b-col
                                            >
                                            <b-col>{{
                                                oGestoriaSolSolicitud.correo
                                            }}</b-col>
                                        </b-row>
                                        <b-row class="mb-2">
                                            <b-col sm="5" class="text-sm-right"
                                                ><b
                                                    >¿Quién le recomendo nuestro
                                                    servicio de Gestoría de
                                                    Visa?:</b
                                                ></b-col
                                            >
                                            <b-col
                                                v-html="
                                                    oGestoriaSolSolicitud.recomendado_por
                                                "
                                            ></b-col>
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
                                                            oGestoriaSolSolicitud.estado_solicitud ==
                                                            'ATENDIDO',
                                                        'badge-primary':
                                                            oGestoriaSolSolicitud.estado_solicitud ==
                                                            'NO RESPONDE',
                                                        'badge-warning':
                                                            oGestoriaSolSolicitud.estado_solicitud ==
                                                            'DESCARTADO',
                                                        'badge-danger':
                                                            oGestoriaSolSolicitud.estado_solicitud ==
                                                            'PENDIENTE',
                                                    }"
                                                    >{{
                                                        oGestoriaSolSolicitud.estado_solicitud
                                                    }}</span
                                                ></b-col
                                            >
                                        </b-row>
                                    </div>
                                    <div class="card-footer">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <button
                                                    class="btn btn-success btn-block btn-flat"
                                                    @click="
                                                        updateEstado('ATENDIDO')
                                                    "
                                                >
                                                    ATENDIDO
                                                </button>
                                            </div>
                                            <div class="col-md-4">
                                                <button
                                                    class="btn btn-primary btn-block btn-flat"
                                                    @click="
                                                        updateEstado(
                                                            'NO RESPONDE'
                                                        )
                                                    "
                                                >
                                                    NO RESPONDE
                                                </button>
                                            </div>
                                            <div class="col-md-4">
                                                <button
                                                    class="btn btn-warning btn-block btn-flat"
                                                    @click="
                                                        updateEstado(
                                                            'DESCARTADO'
                                                        )
                                                    "
                                                >
                                                    DESCARTADO
                                                </button>
                                            </div>
                                        </div>
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
    props: ["id"],
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            permisos: localStorage.getItem("permisos"),
            fullscreenLoading: true,
            loadingWindow: Loading.service({
                fullscreen: this.fullscreenLoading,
            }),
            oGestoriaSolSolicitud: {
                id: 0,
                codigo: "",
                nombres: "",
                apellidos: "",
                fecha_nac: "",
                edad: "",
                nacionalidad: "",
                estado: "",
                sexo: "",
                fono: "",
                familiares_eeuu: "",
                parentesco: "",
                familiar_deportado: "",
                motivo: "",
                deportado_otro_pais: "",
                motivo_otro_pais: "",
                antecedentes_penales: "",
                desc_antecedentes: "",
                estudios: "",
                trabajo_actual: "",
                solicito_visa: "",
                motivo_rechazo: "",
                cuenta_bancaria: "",
                gana_aproximadamente: "",
                redes_sociales: "",
                correo: "",
                recomendado_por: "",
                estado_solicitud: "",
            },
            oGestoriaSolSolicitudSolicitud: null,
            muestra_modal: false,
        };
    },
    mounted() {
        this.loadingWindow.close();
        this.getGestoriaSolicitud();
    },
    methods: {
        getGestoriaSolicitud() {
            this.muestra_modal = false;
            let url = main_url + "/admin/gestoria_solicituds/" + this.id;
            axios.get(url).then((res) => {
                this.oGestoriaSolSolicitud = res.data.gestoria_solicitud;
            });
        },
        updateEstado(estado) {
            let url =
                main_url +
                "/admin/gestoria_solicituds/" +
                this.oGestoriaSolSolicitud.id;
            let badge_class =
                estado == "ATENDIDO"
                    ? "badge-success"
                    : estado == "NO RESPONDE"
                    ? "badge-primary"
                    : "badge-warning";
            Swal.fire({
                icon: "question",
                title: `¿Cambiar el estado de la solicitud con código <b class="badge badge-dark">${this.oGestoriaSolSolicitud.codigo}</b>?`,
                html: `<strong>Se cambiara el estado a <span class="badge ${badge_class}">${estado}</span></strong>`,
                showCancelButton: true,
                confirmButtonColor: "#03a898",
                confirmButtonText: '<i class="fa fa-check"></i> Cambiar',
                cancelButtonText: '<i class="fa fa-ban"></i> Cancelar',
                denyButtonText: `Cancelar`,
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    axios
                        .post(url, {
                            _method: "put",
                            estado_solicitud: estado,
                        })
                        .then((res) => {
                            this.getGestoriaSolicitud();
                            Swal.fire({
                                icon: "success",
                                title: res.data.msj,
                                showConfirmButton: false,
                                timer: 2000,
                            });
                        })
                        .catch((error) => {
                            if (error.response) {
                                if (error.response.status === 422) {
                                    this.errors = error.response.data.errors;
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
                                        showConfirmButton: false,
                                        timer: 2000,
                                    });
                                }
                            }
                        });
                }
            });
        },
    },
};
</script>

<style></style>
