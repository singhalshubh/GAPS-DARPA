# CLOSURE Example: Example 1

## Properties:
* Showcases reliability against Request and Response Packet Loss
* Showcases reliability against Delays
* SHowcases reliability against out of order packets

## Directory Structure

* plain:       contains original unannotated application
* annotated:   contains annotations applied to plain to reflect security intent below
* refactored:  contains annotated code refactored for making security-compliant partitioning feasible
* divvied:     contains code divvied up into separate directories for each level/enclave as input for GEDL generation, followed by code autogeneration
* partitioned: contains fully paritioned sources with cross-domain RPCs, marshalling, serialization, tags, HAL API, etc.

## Cross Domain Topology

* Enclaves: 2 (Orange, Purple)

## Security Intent

* Variable `a` in `get_a()` is in ORANGE and can be shared with PURPLE
* Variable `b` in `get_b()` is in PURPLE and cannot be shared
* Calculated EWMA must be available on PURPLE side (for printing there)

## Example 1 CLE Label Definitions

For convenience, the following CLE label definitions are provided for use in example 1. Place after include directives in `annotated/example1.c`
```
#pragma cle def PURPLE {"level":"purple"}

#pragma cle def ORANGE {"level":"orange",\
  "cdf": [\
    {"remotelevel":"purple", \
     "direction": "egress", \
     "guarddirective": { "operation": "allow"}}\
  ] }

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

## Full Solution
For reference during the independent exercise only, see `.solution` subdirectory for complete working copy of example1 code.

## Dependencies

* CLE Version:
* Refactoring Methodology:
* HAL API:
* DFDL/DAGR:

## Other Tools

None
