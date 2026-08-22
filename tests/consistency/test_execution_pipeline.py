from pathlib import Path
import re
import unittest

ROOT = Path(__file__).resolve().parents[2]


class ExecutionPipelineAcceptance(unittest.TestCase):
    def read(self, rel):
        return (ROOT / rel).read_text(encoding="utf-8")

    def test_pipeline_and_capsule_exist_and_are_compact(self):
        for rel in ["library/EXECUTION-PIPELINE.yaml", "library/STATE-CAPSULE.md"]:
            path = ROOT / rel
            self.assertTrue(path.is_file(), rel)
            self.assertLess(len(path.read_bytes()), 10000, rel)

    def test_stage_order_preserves_human_qc_and_authorized_deploy(self):
        pipe = self.read("library/EXECUTION-PIPELINE.yaml")
        ordered = [
            "id: RESEARCH",
            "id: PLAN",
            "id: DESIGN",
            "id: READINESS",
            "id: BUILD",
            "id: HUMAN_QC",
            "id: DEPLOY_READY",
            "id: DEPLOY",
            "id: POST_DEPLOY_VERIFY",
            "id: CLOSEOUT",
        ]
        positions = [pipe.index(x) for x in ordered]
        self.assertEqual(positions, sorted(positions))
        self.assertIn("human_qc_before_authorized_deployment", pipe)
        self.assertIn("deployment_is_separate_authority", pipe)

    def test_cost_rules_reuse_proof_and_minimize_context(self):
        pipe = self.read("library/EXECUTION-PIPELINE.yaml")
        capsule = self.read("library/STATE-CAPSULE.md").lower()
        for required in [
            "load_only_the_current_stage_and_required_specialists",
            "use_compact_proof_refs_instead_of_replaying_full_logs",
            "run_cheap_deterministic_preflight_before_agent_spawn_or_large_model_reasoning",
            "do_not_rerun_still_valid_gates_after_irrelevant_changes",
            "preserve_failure_fingerprints_and_attempt_counts_across_chats",
        ]:
            self.assertIn(required, pipe)
        self.assertIn("carry proof forward, not the whole conversation", capsule)
        self.assertIn("preserve `unknown`; never compress uncertainty into pass", capsule)

    def test_thin_stage_commands_are_registered_and_small(self):
        registry = self.read("commands/COMMAND-REGISTRY.md")
        for command in ["research", "qc", "deploy"]:
            rel = f"commands/{command}.md"
            path = ROOT / rel
            self.assertTrue(path.is_file(), rel)
            self.assertLess(len(path.read_bytes()), 5000, rel)
            text = path.read_text(encoding="utf-8")
            self.assertIn("**Status:** ACTIVE", text)
            self.assertIn(f"| `{command}` | 0.1.0 |", registry)
            self.assertIn(f"`{command}` -> `{rel}`", registry)

    def test_qc_is_human_fact_not_deployment_authority(self):
        qc = self.read("commands/qc.md").lower()
        self.assertIn("human-observed fact", qc)
        self.assertIn("human qc acceptance is not deployment authority", qc)
        self.assertIn("automated gates at pass", qc)
        self.assertIn("route to debug/verify", qc)

    def test_deploy_requires_authority_exact_candidate_and_post_verify(self):
        deploy = self.read("commands/deploy.md").lower()
        for required in [
            "explicit current deployment authority",
            "/dsp authorize deploy",
            "exact candidate identity",
            "human qc pass",
            "signalproof-release",
            "post-deploy",
            "law, license, terms of service",
            "reuse still-valid evidence",
        ]:
            self.assertIn(required, deploy)

    def test_dsp_is_a_smaller_resolver_and_routes_pipeline(self):
        dsp_path = ROOT / "commands/dsp.md"
        dsp = dsp_path.read_text(encoding="utf-8").lower()
        self.assertLess(len(dsp_path.read_bytes()), 7500)
        for required in [
            "compact resolver",
            "execution-pipeline.yaml",
            "state-capsule.md",
            "/dsp research",
            "/dsp this-plan",
            "/dsp design",
            "/dsp complete",
            "/dsp qc",
            "/dsp authorize deploy",
            "/dsp deploy",
        ]:
            self.assertIn(required, dsp)

    def test_dsp_version_matches_registry(self):
        dsp = self.read("commands/dsp.md")
        registry = self.read("commands/COMMAND-REGISTRY.md")
        match = re.search(r"^\*\*Version:\*\*\s+([^\s]+)", dsp, re.MULTILINE)
        self.assertIsNotNone(match)
        self.assertIn(f"| `/dsp` | {match.group(1)} |", registry)

    def test_new_material_avoids_u2014(self):
        for rel in [
            "library/EXECUTION-PIPELINE.yaml",
            "library/STATE-CAPSULE.md",
            "commands/research.md",
            "commands/qc.md",
            "commands/deploy.md",
            "commands/dsp.md",
            "commands/COMMAND-REGISTRY.md",
        ]:
            self.assertNotIn("\u2014", self.read(rel), rel)


if __name__ == "__main__":
    unittest.main()
