from grafanalib.core import (
    Dashboard,
    Graph,
    GridPos,
    OPS_FORMAT,
    RowPanel,
    SHORT_FORMAT,
    SqlTarget,
    YAxes,
    YAxis,
    PieChartv2,
)

query = """
SELECT
  NOW() as time,
  COUNT(*) as value,
  country as metric,
  get_byte(decode(md5(country),'hex'), 0) / 255.0 * 1250000 AS country_int
  -- CAST(MD5(country) AS int) AS country_int
  -- md5(country)::bit(32)::int as country_int
FROM
  tpf_applicants
GROUP BY metric
ORDER BY value desc
LIMIT 10
"""

dashboard = Dashboard(
    title="Testing SQL based dashboard",
    panels=[
        RowPanel(title="New row", gridPos=GridPos(h=1, w=24, x=0, y=8)),
        PieChartv2(
            title="Some SQL Queries",
            dataSource="oecd_patent",
            targets=[
                SqlTarget(
                    rawSql=query,
                    refId="A",
                ),
            ],
            # yAxes=YAxes(
            #     YAxis(format=OPS_FORMAT),
            #     YAxis(format=SHORT_FORMAT),
            # ),
            gridPos=GridPos(h=8, w=24, x=0, y=9),
        ),
    ],
).auto_panel_ids()
