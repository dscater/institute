<template>
    <div
        class="modal fade"
        :class="{ show: bModal }"
        id="modal-default"
        aria-modal="true"
        role="dialog"
    >
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-success">
                    <h4 class="modal-title" v-text="tituloModal"></h4>
                    <button
                        type="button"
                        class="close"
                        data-dismiss="modal"
                        aria-label="Close"
                        @click="cierraModal"
                    >
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <b-row class="mb-2">
                        <b-col sm="5" class="text-sm-right"
                            ><b>Forma de Pago:</b></b-col
                        >
                        <b-col>
                            <span
                                v-if="
                                    inscripcion_solicitud &&
                                    inscripcion_solicitud.forma_pago != 'OTRO'
                                "
                                >{{ inscripcion_solicitud.forma_pago }}</span
                            >
                            <span v-else>{{
                                inscripcion_solicitud?.desc_otro_pago
                            }}</span></b-col
                        >
                    </b-row>
                    <b-row class="mb-2">
                        <b-col sm="5" class="text-sm-right"
                            ><b>Archivo:</b></b-col
                        >
                        <b-col>
                            <a
                                v-if="
                                    inscripcion_solicitud &&
                                    inscripcion_solicitud.url_archivo
                                "
                                :href="inscripcion_solicitud?.url_archivo"
                                target="_blank"
                                ><i class="fa fa-download"></i
                            ></a>
                            <span v-else>S/A</span>
                        </b-col>
                    </b-row>
                    <b-row class="mb-2">
                        <b-col sm="5" class="text-sm-right"
                            ><b>Descripción:</b></b-col
                        >
                        <b-col
                            ><p
                                v-if="
                                    inscripcion_solicitud &&
                                    inscripcion_solicitud.desc_pago &&
                                    inscripcion_solicitud.desc_pago != ''
                                "
                                v-html="inscripcion_solicitud?.desc_pago"
                            ></p>
                            <span v-else>S/D</span></b-col
                        >
                    </b-row>
                </div>
                <div class="modal-footer justify-content-end">
                    <button
                        type="button"
                        class="btn btn-default"
                        data-dismiss="modal"
                        @click="cierraModal"
                    >
                        Aceptar
                    </button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        muestra_modal: {
            type: Boolean,
            default: false,
        },
        inscripcion_solicitud: {
            type: Object,
            default: {
                inscripcion_id: "",
                curso_id: "",
                nivel: "",
                se_entero: "",
                desc_se_entero: "",
                plan_pago_id: "",
                plan_costo: "",
                forma_pago: "",
                archivo_pago: "",
                desc_pago: "",
                desc_otro_pago: "",
                estado_asignado: "",
                estado: "",
            },
        },
    },
    watch: {
        muestra_modal: function (newVal, oldVal) {
            if (newVal) {
                this.bModal = true;
            } else {
                this.bModal = false;
            }
        },
    },
    computed: {
        tituloModal() {
            return "INFORMACIÓN FORMA DE PAGO";
        },
        textoBoton() {},
    },
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            bModal: this.muestra_modal,
        };
    },
    mounted() {
        this.bModal = this.muestra_modal;
    },
    methods: {
        // Dialog/modal
        cierraModal() {
            this.bModal = false;
            this.$emit("close");
        },
    },
};
</script>

<style></style>
