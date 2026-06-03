# Internet-Exposed Automatic Tank Gauges — U.S. Nationwide Census

An interactive, self-contained dashboard mapping Veeder-Root automatic tank gauge (ATG)
controllers reachable on the public internet, built in response to the June 2, 2026 joint
CISA / FBI / EPA / DOE fact sheet *Hardening Automatic Tank Gauge Systems*.

Prepared by ProCircular.

## What it shows

- **Scale.** 5,612 exposed gauges worldwide; 2,345 in the United States (~42% of the global total).
  Roughly 1,860 appear to be live field devices after cloud-hosted sensors and honeypots are removed.
- **Exposure.** About 80% of the non-honeypot field devices answer with no authentication and
  return their configured banner. Of ~1,768 such devices: 1,417 expose a site name, 655 a street
  address, 602 a full city/state/ZIP, and 1,422 report live tank levels.
- **Geography.** An interactive U.S. choropleth (click a state to filter the inventory).
- **Networks.** Reverse-DNS and ASN breakdowns separating real carrier networks from hosting providers.
- **Inventory.** Every host, filterable and sortable, with a sanitized per-host detail view and CSV export.

This is a configuration exposure, not a software vulnerability — there are no associated CVEs for the
device class. The risk comes from the systems being reachable from the open internet at all.

## How to view

Open `ATG_US_Nationwide_Dashboard.html` in any modern browser. The page is self-contained; charts and
fonts load from public CDNs, and all data is embedded inline (no live API calls).

## Method and privacy

Data is drawn from public Shodan scan results using the fingerprint `port:10001 "I20100" country:US`,
captured as a single point-in-time snapshot. Likely field devices are separated from cloud and honeypot
hosts using Shodan classification tags. Leak rates are computed only over non-honeypot field devices so
decoy banners do not inflate them.

No site names, street addresses, ZIP codes, or full IP addresses are stored in this repository. Individual
addresses are truncated to their /16 network; banner examples are redacted to leak flags, tank counts, and
generic fuel types only. No controller was connected to or interacted with; the analysis rests entirely on
passive Shodan banner data.

Figures reflect a point-in-time snapshot and will change as devices appear, move, or are taken offline.
