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
                    <h4 class="modal-title" v-html="tituloModal"></h4>
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
                    <div class="row">
                        <div class="col-md-12">
                            <label>Para las preguntas:</label>
                            <label
                                >SELECCIÓN; LLENADO INTERMEDIO CON OPCIONES;
                                ELIGE UNA OPCIÓN; LLENADO DOBLE INTERMEDIO CON
                                OPCIONES</label
                            >
                            <p>
                                <i
                                    >Debes ingresar una barra baja "_" en el
                                    enunciado, según el lugar donde corresponda
                                    para indicar el lugar de la respuesta.</i
                                >
                                <i>Ej.: "They arrived _ two o'clock"</i>
                            </p>
                            <p>
                                <i
                                    >Debes ingresar las opciones en el campo
                                    "Ingrese las opciones...".</i
                                >
                            </p>
                            <p>
                                <i
                                    >Para agregar mas opciones debes apretar la tecla
                                    "Enter" o ingresar ";" o ",".</i
                                >
                            </p>
                        </div>
                    </div>
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
            return '<i class="fa fa-info-circle"></i> AYUDA';
        },
    },
    data() {
        return {
            bModal: this.muestra_modal,
        };
    },
    mounted() {},
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
