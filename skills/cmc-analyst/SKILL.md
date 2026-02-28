# Skill: cmc-analyst

## Description
The `cmc-analyst` (Chemistry, Manufacturing, and Controls) skill is a specialized agentic capability for assessing analytical similarity in biosimilar development. It leverages RuVector's graph intelligence and witness chains to provide cryptographically provable comparisons between biosimilar batches and innovator reference products.

## Context Budget
8,000 tokens

## Triggers
- "compare purity profile"
- "aggregation analysis"
- "glycosylation pattern"
- "SEC-HPLC"
- "mass spec"
- "bioassay similarity"

## Core Logic
1.  **Data Retrieval**: Queries RuVector for analytical batches linked by the `analytically_similar_to` edge.
2.  **Context Engineering**: Uses progressive disclosure to load only the relevant analytical methods (e.g., loading only glycosylation data if the query is about glycans).
3.  **Statistical Analysis**: Implements the FDA-recommended f2 statistic for fingerprint correlation.
4.  **Witnessing**: Every conclusion is hashed and signed using RuVector's witness chain (ML-DSA-65) for regulatory auditability.

## Integration
- **Foundation**: RuVector HNSW + GNN
- **Standard**: Allotrope Simple Model (ASM) via `instrument-data-to-allotrope` skill.
- **Audit**: RuVector Witness Segment.
