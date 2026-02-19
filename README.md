# Validador de Números Complejos con Flex

Programa desarrollado en Flex que valida números complejos de la forma:

a + bi

Donde:
- a y b pertenecen a los números reales
- Se permite notación científica (ej: 1.3e-10)
- Se permite signo positivo o negativo
- La parte imaginaria puede terminar en: i, I, j o J
- Se permiten espacios opcionales

---


---

## Compilación

```bash
flex Complejos_Flex.l
gcc lex.yy.c -o complejos -lfl
