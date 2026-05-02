import io
from unittest.mock import patch

from sample import hello


def test_hello_prints():
    with patch('sys.stdout', new_callable=io.StringIO) as mock_stdout:
        hello()
        assert mock_stdout.getvalue() == "Hello\n"
