#!/usr/bin/env python3

from datetime import datetime

target_date = datetime(2024, 3, 21)
current_date = datetime.now()
days_remaining = (target_date - current_date).days

print(f"BKK in {days_remaining} days")
