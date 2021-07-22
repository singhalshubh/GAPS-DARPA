This directory includes a number of example applications, each intended to
exercise specific components of the CLOSURE toolchain.

Each example will include:
  1. Unannotated working input program 
  2. A document in English listing the partitioning intent, security policy 
     (what data needs to protected at what level, and what the cross-domain 
      sharing constraints are), and the properties of input program (e.g., 
      what C/C++ subset, deterministism, concurrency, control, and communication
      patterns)
  3. A document listing the intent in terms of artifacts to be produces, 
     and success criteria for each tool/step, including Preprocessing,
     Conflicts, Refactoring Actions/Advice, Marshalling (IDL generation),
     Autogeneration (Serialization codecs, DFDL, gueard rules in DAGR, and HAL
     config), Security Compliance Verifier, Correctness Verifier, HAL, CVI, MBIG
     (e.g., x86/ARM targets), Emu
  
Until the toolchain is fully implemented, we will additionally need to include
sample output, and intermediate artifacts, which include:
  1. Correctly annotated working input program, conforming to CLE and 
     implementing the partitioning intent
  2. Correctly annotated working partitioned program, conforming to CLE, 
     HAL API, and documented refactoring methodology
  3. Pointers to documentation (with correct version) for CLE, HAL API, 
     DFDL, DAGR, Refactoring methodology, and CLOSURE tool versions to 
     be used for this example

# Cheatsheet for examples 1-3

## Example 1

```
// get_b.b, ewma_main.ewma
#pragma cle def PURPLE {"level":"purple"}

// get_a.a
#pragma cle def ORANGE {"level":"orange",\
  "cdf": [\
    {"remotelevel":"purple", \
     "direction": "egress", \
     "guarddirective": { "operation": "allow"}}\
  ] }

// get_a
#pragma cle def XDLINKAGE_GET_A {"level":"orange",\
  "cdf": [\
    {"remotelevel":"purple", \
     "direction": "bidirectional", \
     "guarddirective": { "operation": "allow"}, \
     "argtaints": [], \
     "codtaints": ["ORANGE"], \
     "rettaints": ["TAG_RESPONSE_GET_A"] \
    } \
  ] }
```
  
## Example 2

```
// get_b.b
#pragma cle def PURPLE {"level":"purple"}

// get_a.a, ewma_main.ewma
#pragma cle def ORANGE {"level":"orange",\
  "cdf": [\
    {"remotelevel":"purple", \
     "direction": "egress", \
     "guarddirective": { "operation": "allow"}}\
  ] }

// get_ewma
#pragma cle def XDLINKAGE_GET_EWMA {"level":"purple",\
  "cdf": [\
    {"remotelevel":"orange", \
     "direction": "bidirectional", \
     "guarddirective": { "operation": "allow"}, \
     "argtaints": [["TAG_REQUEST_GET_EWMA"]], \
     "codtaints": ["PURPLE"], \
     "rettaints": ["TAG_RESPONSE_GET_EWMA"] }\
  ] }
```

## Example 3

```
#pragma cle def PURPLE {"level":"purple"}

#pragma cle def ORANGE {"level":"orange"}

#pragma cle def EWMA_SHAREABLE {"level":"orange",\
  "cdf": [\
    {"remotelevel":"purple", \
     "direction": "egress", \
     "guarddirective": { "operation": "allow"}, \
     "argtaints": [["ORANGE"], ["ORANGE"]], \
     "codtaints": [], \
     "rettaints": ["EWMA_SHAREABLE"] } \
 ] }

#pragma cle def XDLINKAGE_GET_EWMA {"level":"orange",\
  "cdf": [\
    {"remotelevel":"purple", \
     "direction": "bidirectional", \
     "guarddirective": { "operation": "allow"}, \
     "argtaints": [], \
     "codtaints": ["ORANGE","EWMA_SHAREABLE"], \
     "rettaints": ["TAG_RESPONSE_GET_EWMA"] } \
  ] }
```

