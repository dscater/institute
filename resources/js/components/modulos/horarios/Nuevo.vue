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
                    <form>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.grupo_id,
                                    }"
                                    >Seleccionar grupo*</label
                                >
                                <el-select
                                    placeholder="Seleccionar grupo"
                                    class="d-block"
                                    :class="{ 'is-invalid': errors.grupo_id }"
                                    v-model="horario.grupo_id"
                                    clearable
                                    :disabled="horario.existe_asignaciones"
                                >
                                    <el-option
                                        v-for="item in listGrupos"
                                        :key="item.id"
                                        :value="item.id"
                                        :label="item.nombre"
                                    ></el-option>
                                </el-select>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.grupo_id"
                                    v-text="errors.grupo_id[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.modalidad,
                                    }"
                                    >Modalidad*</label
                                >
                                <el-select
                                    placeholder="Modalidad"
                                    class="d-block"
                                    :class="{ 'is-invalid': errors.modalidad }"
                                    v-model="horario.modalidad"
                                    clearable
                                    :disabled="horario.existe_asignaciones"
                                >
                                    <el-option
                                        v-for="item in [
                                            'VIRTUAL',
                                            'PRESENCIAL',
                                        ]"
                                        :key="item"
                                        :value="item"
                                        :label="item"
                                    ></el-option>
                                </el-select>
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.modalidad"
                                    v-text="errors.modalidad[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.fecha_inicio,
                                    }"
                                    >Fecha de Inicio*</label
                                >
                                <input
                                    type="date"
                                    placeholder="Fecha de Inicio"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.fecha_inicio,
                                    }"
                                    v-model="horario.fecha_inicio"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.fecha_inicio"
                                    v-text="errors.fecha_inicio[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.fecha_fin,
                                    }"
                                    >Fecha de Conclusión*</label
                                >
                                <input
                                    type="date"
                                    placeholder="Fecha de Conclusión"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.fecha_fin,
                                    }"
                                    v-model="horario.fecha_fin"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.fecha_fin"
                                    v-text="errors.fecha_fin[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-12">
                                <label>Asignar Horarios</label>
                                <span
                                    class="error invalid-feedback d-block"
                                    v-if="errors.array_dias"
                                    v-text="errors.array_dias[0]"
                                ></span>
                                <table class="tabla_dias">
                                    <thead>
                                        <tr>
                                            <th clas="text-center">
                                                D<span class="dia_txt"
                                                    >omingo</span
                                                >
                                            </th>
                                            <th clas="text-center">
                                                L<span class="dia_txt"
                                                    >unes</span
                                                >
                                            </th>
                                            <th clas="text-center">
                                                M<span class="dia_txt"
                                                    >artes</span
                                                >
                                            </th>
                                            <th clas="text-center">
                                                M<span class="dia_txt"
                                                    >iercoles</span
                                                >
                                            </th>
                                            <th clas="text-center">
                                                J<span class="dia_txt"
                                                    >ueves</span
                                                >
                                            </th>
                                            <th clas="text-center">
                                                V<span class="dia_txt"
                                                    >iernes</span
                                                >
                                            </th>
                                            <th clas="text-center">
                                                S<span class="dia_txt"
                                                    >ábado</span
                                                >
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="p-0 text-center">
                                                <input
                                                    type="checkbox"
                                                    v-model="
                                                        horario.array_dias[0]
                                                    "
                                                    :true-value="1"
                                                    :false-value="0"
                                                    class="form-control"
                                                />
                                            </td>
                                            <td class="p-0 text-center">
                                                <input
                                                    type="checkbox"
                                                    v-model="
                                                        horario.array_dias[1]
                                                    "
                                                    :true-value="1"
                                                    :false-value="0"
                                                    class="form-control"
                                                />
                                            </td>
                                            <td class="p-0 text-center">
                                                <input
                                                    type="checkbox"
                                                    v-model="
                                                        horario.array_dias[2]
                                                    "
                                                    :true-value="1"
                                                    :false-value="0"
                                                    class="form-control"
                                                />
                                            </td>
                                            <td class="p-0 text-center">
                                                <input
                                                    type="checkbox"
                                                    v-model="
                                                        horario.array_dias[3]
                                                    "
                                                    :true-value="1"
                                                    :false-value="0"
                                                    class="form-control"
                                                />
                                            </td>
                                            <td class="p-0 text-center">
                                                <input
                                                    type="checkbox"
                                                    v-model="
                                                        horario.array_dias[4]
                                                    "
                                                    :true-value="1"
                                                    :false-value="0"
                                                    class="form-control"
                                                />
                                            </td>
                                            <td class="p-0 text-center">
                                                <input
                                                    type="checkbox"
                                                    v-model="
                                                        horario.array_dias[5]
                                                    "
                                                    :true-value="1"
                                                    :false-value="0"
                                                    class="form-control"
                                                />
                                            </td>
                                            <td class="p-0 text-center">
                                                <input
                                                    type="checkbox"
                                                    v-model="
                                                        horario.array_dias[6]
                                                    "
                                                    :true-value="1"
                                                    :false-value="0"
                                                    class="form-control"
                                                />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.hora_inicio,
                                    }"
                                    >Hora de Inicio*</label
                                >
                                <input
                                    type="time"
                                    placeholder="Hora de Inicio"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.hora_inicio,
                                    }"
                                    v-model="horario.hora_inicio"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.hora_inicio"
                                    v-text="errors.hora_inicio[0]"
                                ></span>
                            </div>
                            <div class="form-group col-md-6">
                                <label
                                    :class="{
                                        'text-danger': errors.hora_fin,
                                    }"
                                    >Hora de Finalización*</label
                                >
                                <input
                                    type="time"
                                    placeholder="Hora de Finalización"
                                    class="form-control"
                                    :class="{
                                        'is-invalid': errors.hora_fin,
                                    }"
                                    v-model="horario.hora_fin"
                                />
                                <span
                                    class="error invalid-feedback"
                                    v-if="errors.hora_fin"
                                    v-text="errors.hora_fin[0]"
                                ></span>
                            </div>
                        </div>
                    </form>
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
                    <el-button
                        type="success"
                        class="bg-success"
                        :loading="enviando"
                        @click="setRegistroModal()"
                        >{{ textoBoton }}</el-button
                    >
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
        accion: {
            type: String,
            default: "nuevo",
        },
        horario: {
            type: Object,
            default: {
                grupo_id: "",
                modalidad: "",
                dias: "",
                array_dias: [0, 0, 0, 0, 0, 0, 0],
                fecha_inicio: "",
                fecha_fin: "",
                hora_inicio: "",
                hora_fin: "",
            },
        },
    },
    watch: {
        muestra_modal: function (newVal, oldVal) {
            this.errors = [];
            if (newVal) {
                this.bModal = true;
            } else {
                this.bModal = false;
            }
        },
    },
    computed: {
        tituloModal() {
            if (this.accion == "nuevo") {
                return "AGREGAR HORARIO";
            } else {
                return "MODIFICAR REGISTRO";
            }
        },
        textoBoton() {
            if (this.accion == "nuevo") {
                return "Registrar";
            } else {
                return "Actualizar";
            }
        },
    },
    data() {
        return {
            user: JSON.parse(localStorage.getItem("user")),
            bModal: this.muestra_modal,
            enviando: false,
            errors: [],
            listGrupos: [],
        };
    },
    mounted() {
        this.getGruposActivos();
        this.bModal = this.muestra_modal;
    },
    methods: {
        getGruposActivos() {
            axios.get(main_url + "/admin/grupos/activos").then((response) => {
                this.listGrupos = response.data.grupos;
            });
        },
        setRegistroModal() {
            this.enviando = true;
            try {
                this.textoBtn = "Enviando...";
                let url = main_url + "/admin/horarios";
                let config = {
                    headers: {
                        "Content-Type": "multipart/form-data",
                    },
                };
                let formdata = new FormData();
                formdata.append(
                    "grupo_id",
                    this.horario.grupo_id ? this.horario.grupo_id : ""
                );
                formdata.append(
                    "modalidad",
                    this.horario.modalidad ? this.horario.modalidad : ""
                );
                formdata.append(
                    "array_dias",
                    this.horario.array_dias ? this.horario.array_dias : ""
                );
                formdata.append(
                    "fecha_inicio",
                    this.horario.fecha_inicio ? this.horario.fecha_inicio : ""
                );
                formdata.append(
                    "fecha_fin",
                    this.horario.fecha_fin ? this.horario.fecha_fin : ""
                );
                formdata.append(
                    "hora_inicio",
                    this.horario.hora_inicio ? this.horario.hora_inicio : ""
                );
                formdata.append(
                    "hora_fin",
                    this.horario.hora_fin ? this.horario.hora_fin : ""
                );
                if (this.accion == "edit") {
                    url = main_url + "/admin/horarios/" + this.horario.id;
                    formdata.append("_method", "PUT");
                }
                axios
                    .post(url, formdata, config)
                    .then((res) => {
                        this.enviando = false;
                        Swal.fire({
                            icon: "success",
                            title: res.data.msj,
                            showConfirmButton: false,
                            timer: 1500,
                        });
                        this.limpiaHorario();
                        this.$emit("envioModal");
                        this.errors = [];
                        if (this.accion == "edit") {
                            this.textoBtn = "Actualizar";
                        } else {
                            this.textoBtn = "Registrar";
                        }
                    })
                    .catch((error) => {
                        this.enviando = false;
                        if (this.accion == "edit") {
                            this.textoBtn = "Actualizar";
                        } else {
                            this.textoBtn = "Registrar";
                        }
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
        limpiaHorario() {
            this.errors = [];
            this.horario.grupo_id = "";
            this.horario.modalidad = "";
            this.horario.dias = "";
            this.horario.fecha_inicio = "";
            this.horario.fecha_fin = "";
            this.horario.hora_inicio = "";
            this.horario.hora_fin = "";
        },
    },
};
</script>

<style>
.tabla_dias {
    width: 100%;
}

.tabla_dias thead tr th,
.tabla_dias tbody tr td {
    text-align: center;
}
@media (max-width: 800px) {
    .dia_txt {
        display: none;
    }
}
</style>
