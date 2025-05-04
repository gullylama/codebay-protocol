
;; CodeBay Certification Smart Contract (v0.1)
;; This contract stores the certification record on-chain for trust and timestamp verification.

(define-map certification
  { id: uint }
  {
    domain: (buff 64),               ;; Domain name associated with the certification
    issued: uint,                    ;; Unix timestamp of certification
    tier: (string-ascii 10),         ;; Certification tier: "Gold" or "Purple"
    metadata_hash: (buff 32),        ;; Hash of the off-chain metadata for integrity
    active: bool                     ;; Whether the certification is currently valid
  }
)

(define-public (register-cert (id uint) (domain (buff 64)) (tier (string-ascii 10)) (metadata_hash (buff 32)))
  (begin
    (map-set certification
      { id: id }
      {
        domain: domain,
        issued: (as-max-int u0), ;; Set to current block timestamp
        tier: tier,
        metadata_hash: metadata_hash,
        active: true
      })
    (ok true)
  )
)

(define-public (revoke-cert (id uint))
  (begin
    (map-set certification
      { id: id }
      (merge
        (unwrap! (map-get? certification { id: id }) (err u404))
        { active: false }))
    (ok true)
  )
)

(define-read-only (get-cert (id uint))
  (map-get? certification { id: id })
)
