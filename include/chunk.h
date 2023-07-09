#ifndef clox_chunk_h
#define clox_chunk_h

#include "common.h"
#include "value.h"

typedef enum {
    OP_CONSTANT,
    OP_NIL,
    OP_TRUE,
    OP_FALSE,
    OP_EQUAL,
    OP_GREATER,
    OP_LESS,
    OP_ADD,
    OP_SUBTRACT,
    OP_MULTIPLY,
    OP_DIVIDE,
    OP_NOT,
    OP_NEGATE,
    OP_RETURN
} OpCode;

typedef struct {
    int count;
    int capacity;
    u8* code;
    int* lines;
    ValueArray constants;
} Chunk;

// initializes a chunk to a well-defined state.
void initChunk(Chunk* chunk);

// frees a chunk
void freeChunk(Chunk* chunk);

// writes a byte to the chunk.
void writeChunk(Chunk* chunk, u8 byte, int line);

// appends a constant to the chunk's internal value array.
// returns the index of the added constant.
int addConstant(Chunk* chunk, Value value);
#endif
