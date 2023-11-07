<template>
    <div class="col-md-12 mt-0">
        <div class="row">
            <div class="col-md-6 input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text">{{
                        index_pregunta + 1
                    }}</span>
                </div>
                <textarea
                    class="rounded-0 form-control"
                    v-model="pregunta.pregunta"
                    placeholder="Ingresar enunciado de la pregunta..."
                    rows="1"
                    :class="{
                        'is-invalid':
                            errors[
                                'examen_enunciados_' +
                                    index +
                                    '_enunciado_preguntas_' +
                                    index_pregunta +
                                    '_pregunta'
                            ],
                    }"
                    autosize
                ></textarea>
                <div class="input-group-append">
                    <button
                        class="btn btn-danger rounded-0"
                        type="button"
                        @click="eliminaComponentePregunta"
                    >
                        <i class="fa fa-trash"></i>
                    </button>
                </div>
            </div>
            <div
                class="col-md-6"
                v-if="
                    tipo_pregunta == 'SELECCIÓN' ||
                    tipo_pregunta == 'LLENADO INTERMEDIO CON OPCIONES' ||
                    tipo_pregunta == 'ELIGE UNA OPCIÓN' ||
                    tipo_pregunta == 'LLENADO DOBLE INTERMEDIO CON OPCIONES'
                "
            >
                <b-form-tags
                    class="rounded-0"
                    :class="{
                        'is-invalid':
                            errors[
                                'examen_enunciados_' +
                                    index +
                                    '_enunciado_preguntas_' +
                                    index_pregunta +
                                    '_opciones'
                            ],
                    }"
                    input-id="tags-basic"
                    placeholder="Ingrese las opciones..."
                    v-model="pregunta.array_opciones"
                    addButtonText="Agregar"
                    separator=",;"
                    remove-on-delete
                ></b-form-tags>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: {
        index: {
            type: Number,
            default: 0,
        },
        index_pregunta: {
            type: Number,
            default: 0,
        },
        pregunta: {
            type: Object,
            default: {
                id: 0,
                examen_enunciado_id: 0,
                pregunta: "",
                tipo: "LLENADO",
                opciones: "",
                array_opciones: [],
            },
        },
        errors_form: {
            type: [],
            default: [],
        },
    },
    watch: {
        pregunta: {
            handler(newPregunta, oldPregunta) {
                this.tipo_pregunta = newPregunta.tipo;
            },
            deep: true, // Observa propiedades anidadas
        },
        errors_form: {
            handler(newerrors, olderrors) {
                this.errors = newerrors;
            },
            deep: true, // Observa propiedades anidadas
        },
    },
    computed: {},
    data() {
        return {
            tipo_pregunta: this.pregunta.tipo,
            errors: this.errors_form,
        };
    },
    mounted() {},
    methods: {
        eliminaComponentePregunta() {
            this.$emit(
                "eliminado",
                this.index,
                this.index_pregunta,
                this.pregunta.id
            );
        },
    },
};
</script>

<style></style>
