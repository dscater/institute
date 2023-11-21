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
                            <h5>{{ asignacion_grupo?.grupo?.nombre }}</h5>
                            <p>
                                <strong>Estudiante: </strong>
                                {{ asignacion_grupo?.inscripcion.full_name }}
                            </p>
                            <p>
                                <strong>Curso: </strong>
                                {{
                                    asignacion_grupo?.inscripcion_solicitud
                                        ?.curso.nombre
                                }}
                            </p>
                        </div>
                        <div class="col-md-12 form-group">
                            <label>Calificación</label>
                            <input
                                type="number"
                                min="0"
                                max="100"
                                v-model="asignacion_grupo.calificacion"
                                class="form-control"
                            />
                            <span
                                class="error invalid-feedback d-block"
                                v-if="errors.calificacion"
                                v-text="errors.calificacion[0]"
                            ></span>
                        </div>
                        <div class="col-md-12 form-group">
                            <label>Estado</label>
                            <select
                                class="form-control"
                                v-model="asignacion_grupo.estado"
                            >
                                <option
                                    v-for="item in [
                                        'PENDIENTE',
                                        'APROBÓ',
                                        'REPROBÓ',
                                        'ABANDONÓ',
                                    ]"
                                    :key="item"
                                    :value="item"
                                    :label="item"
                                ></option>
                            </select>
                            <span
                                class="error invalid-feedback d-block"
                                v-if="errors.estado"
                                v-text="errors.estado[0]"
                            ></span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer justify-content-between">
                    <button
                        type="button"
                        class="btn btn-default"
                        data-dismiss="modal"
                        @click="cierraModal"
                    >
                        Cerrar
                    </button>
                    <button
                        type="button"
                        class="btn btn-success"
                        data-dismiss="modal"
                        @click="registrarEstado"
                    >
                        Actualizar calificación
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
        asignacion_grupo: {
            type: Object,
            default: {
                id: 0,
                grupo_id: "",
                inscripcion_id: "",
                inscripcion_solicitud_id: "",
                curso_id: "",
                calificacion: "",
                estado: "",
                inscripcion: {
                    full_name: "",
                },
                inscripcion_solicitud: {
                    curso: {
                        nombre: "",
                    },
                },
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
            return '<i class="fa fa-clipboard-check"></i> CALIFCACIÓN DEL CURSO';
        },
    },
    data() {
        return {
            bModal: this.muestra_modal,
            errors: [],
        };
    },
    mounted() {},
    methods: {
        registrarEstado() {
            try {
                this.enviando = true;
                let url =
                    main_url +
                    "/admin/asignacion_grupos/actualizar_estado/" +
                    this.asignacion_grupo.id;
                axios
                    .post(url, {
                        calificacion: this.asignacion_grupo.calificacion,
                        estado: this.asignacion_grupo.estado,
                    })
                    .then((res) => {
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: false,
                            timer: 1500,
                        });
                        this.cierraModal();
                        this.errors = [];
                    })
                    .catch((error) => {
                        if (error.response) {
                            if (error.response.status === 422) {
                                this.errors = error.response.data.errors;
                                let mensaje = `<ul class="text-left">`;
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
                                    showConfirmButton: false,
                                    timer: 2000,
                                });
                            }
                        }
                    });
            } catch (e) {
                this.enviando = false;
                console.log(e);
            }
        },
        // Dialog/modal
        cierraModal() {
            this.bModal = false;
            this.$emit("close");
        },
    },
};
</script>

<style></style>
