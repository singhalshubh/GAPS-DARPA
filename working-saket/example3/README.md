# CLOSURE Example: Example 3

## Directory Structure

* plain:       contains original unannotated application
* annotated:   contains annotations applied to plain to reflect security intent below
* refactored:  contains annotated code refactored for making security-compliant partitioning feasible
* divvied:     contains code divvied up into separate directories for each level/enclave as input for GEDL generation, followed by code autogeneration
* partitioned: contains fully paritioned sources with cross-domain RPCs, marshalling, serialization, tags, HAL API, etc.

## Cross Domain Topology

* Enclaves: 2 (Orange, Purple)

## Security Intent

* Variable `a` in `get_a()` is in ORANGE and cannot be shared 
* Variable `b` in `get_b()` is in ORANGE and cannot be shared 
* EWMA must therefore be computed on ORANGE; EWMA is sharable to PURPLE.
Calculated EWMA must be available on PURPLE side (for printing there)

## Example 3 CLE Label Definitions

For convenience, the following CLE label definitions are provided for use in example 3. Place after include directives in `annotated/example3.c`
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

## Full Solution
For reference during the independent exercise only, see `.solution` subdirectory for complete working copy of example3 code.

## Dependencies

* CLE Version:
* Refactoring Methodology:
  
  * refactoring of function needed for consistent security policy annotation; ewma_main on purple, but touches non-shareable orange side vars  
* HAL API:
* DFDL/DAGR:

## Other Tools

None
