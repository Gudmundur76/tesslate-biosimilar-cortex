# Skill: regulatory-strategist

## Description
The `regulatory-strategist` skill is a specialized agentic capability for regulatory intelligence and compliance strategy in biosimilar development. It leverages RuVector's graph intelligence and witness chains to provide cryptographically auditable regulatory assessments, pathway recommendations, and submission-ready compliance reports.

## Context Budget
10,000 tokens

## Triggers
- "regulatory pathway"
- "FDA 351(k)"
- "EMA biosimilar"
- "compliance report"
- "submission strategy"
- "regulatory gap analysis"

## Core Logic
1.  **Pathway Analysis**: Queries RuVector for regulatory precedents and pathway requirements linked by the `regulatory_pathway_for` edge.
2.  **Context Engineering**: Uses progressive disclosure to load only the relevant regulatory framework (e.g., loading only FDA guidance if the query is about a US submission).
3.  **Gap Analysis**: Compares the current program data against regulatory requirements to identify missing studies or documentation.
4.  **Report Generation**: Produces submission-ready compliance reports with structured findings and recommendations.
5.  **Witnessing**: Every regulatory conclusion is hashed and signed using RuVector's witness chain (ML-DSA-65) for auditability.

## Integration
- **Foundation**: RuVector HNSW + GNN
- **Standard**: ICH Guidelines (Q5E, Q6B) and regional regulatory frameworks.
- **Audit**: RuVector Witness Segment.
