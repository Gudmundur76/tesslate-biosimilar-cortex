from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Dict, Any
from ..core.orchestrator import Orchestrator

app = FastAPI(title="Tesslate Biosimilar Cortex API")
orchestrator = Orchestrator()

class ProvisionProgramRequest(BaseModel:
    client_name: str
    molecule: str
    reference_product: str
    regulatory_pathway: str
    rvf_config: Dict[str, Any]

class CmcAnalysisRequest(BaseModel:
    batch_id: str
    method: str
    innovator_batch_id: str
    batch_data: Dict[str, Any]
    innovator_data: Dict[str, Any]

@app.post("/provision-program")
async def provision_program(request: ProvisionProgramRequest):
    try:
        result = orchestrator.provision_biosimilar_program(
            client_name=request.client_name,
            molecule=request.molecule,
            reference_product=request.reference_product,
            regulatory_pathway=request.regulatory_pathway,
            rvf_config=request.rvf_config
        )
        return result
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.post("/cmc-analysis")
async def cmc_analysis(request: CmcAnalysisRequest):
    try:
        result = orchestrator.execute_cmc_analysis(
            batch_id=request.batch_id,
            method=request.method,
            innovator_batch_id=request.innovator_batch_id,
            batch_data=request.batch_data,
            innovator_data=request.innovator_data
        )
        return result
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/health")
async def health_check():
    return {"status": "ok", "message": "Tesslate Biosimilar Cortex API is running"}
